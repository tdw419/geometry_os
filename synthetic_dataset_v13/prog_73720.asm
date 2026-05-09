; DESCRIPTION: Draws a black rectangle at (27, 55) with width 24 and height 67.
; PLAN: r0=27(x), r1=55(y), r2=24(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 55
LDI r2, 24
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
