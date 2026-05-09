; DESCRIPTION: Composite: Places a orange line segment connecting (130, 231) to (17, 18) then Draws a orange circle centered at (313, 219) with radius 20.
; PLAN: r0=130(x1), r1=231(y1), r2=17(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=219(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 130
LDI r1, 231
LDI r2, 17
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 219
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
