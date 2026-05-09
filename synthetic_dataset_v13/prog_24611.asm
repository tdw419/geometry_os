; DESCRIPTION: Composite: Places a red dot at position (119, 213) then Places a white line segment connecting (186, 108) to (360, 163).
; PLAN: r0=119(x), r1=213(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=186(x1), r6=108(y1), r7=360(x2), r8=163(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 213
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 186
LDI r6, 108
LDI r7, 360
LDI r8, 163
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
