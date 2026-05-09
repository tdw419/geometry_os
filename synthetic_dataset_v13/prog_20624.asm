; DESCRIPTION: Composite: Renders a blue disk with center (369, 110) and radius 76 then Places a purple dot at position (184, 63) then Renders a blue box of size 10x71 starting at (180, 157).
; PLAN: r0=369(x), r1=110(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=63(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=180(x), r11=157(y), r12=10(width), r13=71(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 110
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 63
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 180
LDI r11, 157
LDI r12, 10
LDI r13, 71
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
