; DESCRIPTION: Draws a black rectangle at (394, 128) with width 116 and height 67.
; PLAN: r0=394(x), r1=128(y), r2=116(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 128
LDI r2, 116
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
