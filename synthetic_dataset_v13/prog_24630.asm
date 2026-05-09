; DESCRIPTION: Composite: Places a orange line segment connecting (133, 160) to (294, 54) then Places a purple circle of radius 80 at center (109, 129).
; PLAN: r0=133(x1), r1=160(y1), r2=294(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=129(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 160
LDI r2, 294
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 129
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
