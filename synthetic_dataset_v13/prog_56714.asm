; DESCRIPTION: Composite: Renders a yellow disk with center (62, 67) and radius 24 then Sets a single orange pixel at (199, 77) then Draws a red line from (407, 18) to (471, 20).
; PLAN: r0=62(x), r1=67(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x), r6=77(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=407(x1), r11=18(y1), r12=471(x2), r13=20(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 67
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 77
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 407
LDI r11, 18
LDI r12, 471
LDI r13, 20
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
