; DESCRIPTION: Composite: Places a yellow dot at position (6, 232) then Renders a white line between points (360, 150) and (32, 152).
; PLAN: r0=6(x), r1=232(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=360(x1), r6=150(y1), r7=32(x2), r8=152(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 232
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 360
LDI r6, 150
LDI r7, 32
LDI r8, 152
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
