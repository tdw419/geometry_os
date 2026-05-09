; DESCRIPTION: Draws a black rectangle at (149, 67) with width 37 and height 68.
; PLAN: r0=149(x), r1=67(y), r2=37(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 67
LDI r2, 37
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
