; DESCRIPTION: Composite: Places a orange line segment connecting (261, 130) to (423, 60) then Renders a yellow disk with center (314, 46) and radius 26.
; PLAN: r0=261(x1), r1=130(y1), r2=423(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=46(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 130
LDI r2, 423
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 46
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
