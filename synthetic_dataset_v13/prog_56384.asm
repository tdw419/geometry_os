; DESCRIPTION: Composite: Creates a blue circular shape at (261, 198) with radius 53 then Sets a single magenta pixel at (105, 121) then Creates a red rectangular region at (292, 68) spanning 34 by 93 pixels.
; PLAN: r0=261(x), r1=198(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=121(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=292(x), r11=68(y), r12=34(width), r13=93(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 198
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 121
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 292
LDI r11, 68
LDI r12, 34
LDI r13, 93
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
