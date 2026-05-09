; DESCRIPTION: Composite: Creates a red rectangular region at (379, 92) spanning 79 by 10 pixels then Places a purple dot at position (151, 238) then Places a white circle of radius 66 at center (284, 136).
; PLAN: r0=379(x), r1=92(y), r2=79(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=238(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=284(x), r11=136(y), r12=66(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 379
LDI r1, 92
LDI r2, 79
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 238
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 284
LDI r11, 136
LDI r12, 66
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
