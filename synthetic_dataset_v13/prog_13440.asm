; DESCRIPTION: Composite: Renders a yellow disk with center (126, 127) and radius 53 then Places a purple dot at position (369, 192) then Creates a green rectangular region at (315, 78) spanning 108 by 93 pixels.
; PLAN: r0=126(x), r1=127(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=192(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=315(x), r11=78(y), r12=108(width), r13=93(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 126
LDI r1, 127
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 192
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 315
LDI r11, 78
LDI r12, 108
LDI r13, 93
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
