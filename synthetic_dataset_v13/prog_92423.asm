; DESCRIPTION: Draws a red rectangle at (107, 73) with width 114 and height 101.
; PLAN: r0=107(x), r1=73(y), r2=114(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 73
LDI r2, 114
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
