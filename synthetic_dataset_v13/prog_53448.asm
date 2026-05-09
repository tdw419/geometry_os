; DESCRIPTION: Composite: Renders a green disk with center (100, 162) and radius 53 then Places a yellow dot at position (215, 44) then Draws a blue rectangle at (132, 121) with width 96 and height 72.
; PLAN: r0=100(x), r1=162(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x), r6=44(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=132(x), r11=121(y), r12=96(width), r13=72(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 162
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 44
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 132
LDI r11, 121
LDI r12, 96
LDI r13, 72
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
