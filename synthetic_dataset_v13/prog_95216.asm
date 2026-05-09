; DESCRIPTION: Places a black 34x116 rectangle at position (447, 126).
; PLAN: r0=447(x), r1=126(y), r2=34(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 126
LDI r2, 34
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
