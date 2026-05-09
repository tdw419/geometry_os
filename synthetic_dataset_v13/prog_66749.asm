; DESCRIPTION: Composite: Places a magenta dot at position (345, 232) then Renders a white disk with center (289, 148) and radius 17 then Renders a orange line between points (300, 138) and (209, 121).
; PLAN: r0=345(x), r1=232(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=148(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=300(x1), r11=138(y1), r12=209(x2), r13=121(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 232
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 148
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 300
LDI r11, 138
LDI r12, 209
LDI r13, 121
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
