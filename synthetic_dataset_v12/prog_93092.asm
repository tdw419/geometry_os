; DESCRIPTION: Composite: Renders a orange disk with center (92, 134) and radius 17 then Sets a single green pixel at (71, 216) then Places a orange line segment connecting (240, 205) to (58, 181).
; PLAN: r0=92(x), r1=134(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=71(x), r6=216(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=240(x1), r11=205(y1), r12=58(x2), r13=181(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 134
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 71
LDI r6, 216
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 240
LDI r11, 205
LDI r12, 58
LDI r13, 181
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
