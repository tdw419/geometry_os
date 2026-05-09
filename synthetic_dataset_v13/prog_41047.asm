; DESCRIPTION: Composite: Draws a yellow line from (247, 220) to (314, 17) then Creates a orange circular shape at (71, 183) with radius 55.
; PLAN: r0=247(x1), r1=220(y1), r2=314(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=183(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 220
LDI r2, 314
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 183
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
