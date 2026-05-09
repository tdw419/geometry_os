; DESCRIPTION: Draws a yellow rectangle at (151, 67) with width 53 and height 61.
; PLAN: r0=151(x), r1=67(y), r2=53(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 67
LDI r2, 53
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
