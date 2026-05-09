; DESCRIPTION: Composite: Creates a magenta rectangular region at (72, 41) spanning 14 by 66 pixels then Creates a purple circular shape at (291, 81) with radius 64 then Renders a black line between points (293, 238) and (300, 51).
; PLAN: r0=72(x), r1=41(y), r2=14(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=81(y), r7=64(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=293(x1), r11=238(y1), r12=300(x2), r13=51(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 41
LDI r2, 14
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 81
LDI r7, 64
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 293
LDI r11, 238
LDI r12, 300
LDI r13, 51
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
