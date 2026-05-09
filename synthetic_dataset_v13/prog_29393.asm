; DESCRIPTION: Draws a yellow rectangle at (282, 27) with width 60 and height 67.
; PLAN: r0=282(x), r1=27(y), r2=60(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 27
LDI r2, 60
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
