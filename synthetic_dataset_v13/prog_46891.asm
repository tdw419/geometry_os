; DESCRIPTION: Composite: Draws a cyan circle centered at (254, 22) with radius 20 then Renders a green line between points (251, 26) and (115, 85).
; PLAN: r0=254(x), r1=22(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x1), r6=26(y1), r7=115(x2), r8=85(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 22
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 26
LDI r7, 115
LDI r8, 85
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
