; DESCRIPTION: Composite: Draws a orange line from (463, 130) to (148, 150) then Renders a yellow disk with center (294, 162) and radius 72 then Sets a single yellow pixel at (291, 158).
; PLAN: r0=463(x1), r1=130(y1), r2=148(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=162(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=291(x), r11=158(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 463
LDI r1, 130
LDI r2, 148
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 162
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 291
LDI r11, 158
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
