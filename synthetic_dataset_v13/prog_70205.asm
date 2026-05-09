; DESCRIPTION: Composite: Places a blue line segment connecting (481, 238) to (55, 101) then Places a magenta circle of radius 51 at center (72, 81) then Renders a black box of size 109x116 starting at (292, 95).
; PLAN: r0=481(x1), r1=238(y1), r2=55(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=81(y), r7=51(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=292(x), r11=95(y), r12=109(width), r13=116(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 481
LDI r1, 238
LDI r2, 55
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 81
LDI r7, 51
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 292
LDI r11, 95
LDI r12, 109
LDI r13, 116
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
