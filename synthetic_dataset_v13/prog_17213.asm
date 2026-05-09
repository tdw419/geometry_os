; DESCRIPTION: Composite: Renders a black box of size 111x92 starting at (30, 66) then Draws a purple circle centered at (72, 138) with radius 38.
; PLAN: r0=30(x), r1=66(y), r2=111(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=138(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 66
LDI r2, 111
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 138
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
