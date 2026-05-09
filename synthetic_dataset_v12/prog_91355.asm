; DESCRIPTION: Draws a black rectangle at (39, 67) with width 53 and height 94.
; PLAN: r0=39(x), r1=67(y), r2=53(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 67
LDI r2, 53
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
