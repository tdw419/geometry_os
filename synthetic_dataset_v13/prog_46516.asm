; DESCRIPTION: Composite: Renders a purple disk with center (85, 163) and radius 59 then Sets a single green pixel at (124, 216) then Draws a purple rectangle at (138, 64) with width 119 and height 57.
; PLAN: r0=85(x), r1=163(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=216(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=138(x), r11=64(y), r12=119(width), r13=57(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 163
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 216
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 138
LDI r11, 64
LDI r12, 119
LDI r13, 57
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
