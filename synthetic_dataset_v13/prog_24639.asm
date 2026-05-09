; DESCRIPTION: Composite: Renders a yellow disk with center (96, 174) and radius 76 then Draws a purple rectangle at (428, 139) with width 53 and height 48 then Places a black dot at position (209, 101).
; PLAN: r0=96(x), r1=174(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=139(y), r7=53(width), r8=48(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=209(x), r11=101(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 174
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 139
LDI r7, 53
LDI r8, 48
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 101
LDI r12, 0x000000
PSET r10, r11, r12
HALT
