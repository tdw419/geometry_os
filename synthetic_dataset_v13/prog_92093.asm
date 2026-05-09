; DESCRIPTION: Places a black 55x96 rectangle at position (316, 116).
; PLAN: r0=316(x), r1=116(y), r2=55(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 116
LDI r2, 55
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
