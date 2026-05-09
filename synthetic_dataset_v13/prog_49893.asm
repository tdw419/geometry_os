; DESCRIPTION: Composite: Renders a orange disk with center (200, 184) and radius 59 then Places a yellow line segment connecting (355, 234) to (254, 245).
; PLAN: r0=200(x), r1=184(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x1), r6=234(y1), r7=254(x2), r8=245(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 184
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 234
LDI r7, 254
LDI r8, 245
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
