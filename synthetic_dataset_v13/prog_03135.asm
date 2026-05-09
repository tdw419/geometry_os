; DESCRIPTION: Draws a red rectangle at (67, 128) with width 22 and height 14.
; PLAN: r0=67(x), r1=128(y), r2=22(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 128
LDI r2, 22
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
