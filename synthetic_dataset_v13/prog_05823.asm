; DESCRIPTION: Composite: Draws a black circle centered at (150, 124) with radius 35 then Renders a purple line between points (49, 78) and (100, 61).
; PLAN: r0=150(x), r1=124(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x1), r6=78(y1), r7=100(x2), r8=61(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 124
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 78
LDI r7, 100
LDI r8, 61
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
