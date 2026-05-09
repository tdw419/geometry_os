; DESCRIPTION: Composite: Places a green circle of radius 78 at center (153, 169) then Places a purple dot at position (105, 21) then Renders a yellow box of size 35x69 starting at (158, 173).
; PLAN: r0=153(x), r1=169(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=21(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=158(x), r11=173(y), r12=35(width), r13=69(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 169
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 21
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 158
LDI r11, 173
LDI r12, 35
LDI r13, 69
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
