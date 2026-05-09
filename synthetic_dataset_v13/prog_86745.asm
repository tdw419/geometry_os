; DESCRIPTION: Draws a black rectangle at (228, 62) with width 114 and height 67.
; PLAN: r0=228(x), r1=62(y), r2=114(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 62
LDI r2, 114
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
