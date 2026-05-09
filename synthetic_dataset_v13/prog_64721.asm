; DESCRIPTION: Composite: Places a magenta line segment connecting (12, 160) to (89, 215) then Creates a green circular shape at (390, 109) with radius 18.
; PLAN: r0=12(x1), r1=160(y1), r2=89(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=109(y), r7=18(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 160
LDI r2, 89
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 109
LDI r7, 18
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
