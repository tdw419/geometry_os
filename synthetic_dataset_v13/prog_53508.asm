; DESCRIPTION: Composite: Places a red circle of radius 60 at center (171, 109) then Places a cyan line segment connecting (309, 145) to (16, 72).
; PLAN: r0=171(x), r1=109(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x1), r6=145(y1), r7=16(x2), r8=72(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 109
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 145
LDI r7, 16
LDI r8, 72
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
