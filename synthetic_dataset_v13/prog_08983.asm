; DESCRIPTION: Composite: Draws a black rectangle at (278, 15) with width 10 and height 67 then Renders a purple disk with center (148, 92) and radius 55.
; PLAN: r0=278(x), r1=15(y), r2=10(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x), r6=92(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 278
LDI r1, 15
LDI r2, 10
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 92
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
