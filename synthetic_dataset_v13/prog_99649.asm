; DESCRIPTION: Draws a black rectangle at (116, 42) with width 119 and height 26.
; PLAN: r0=116(x), r1=42(y), r2=119(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 42
LDI r2, 119
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
