; DESCRIPTION: Composite: Places a black circle of radius 11 at center (29, 77) then Places a red dot at position (59, 129) then Draws a blue rectangle at (157, 198) with width 33 and height 23.
; PLAN: r0=29(x), r1=77(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x), r6=129(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=157(x), r11=198(y), r12=33(width), r13=23(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 77
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 129
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 157
LDI r11, 198
LDI r12, 33
LDI r13, 23
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
