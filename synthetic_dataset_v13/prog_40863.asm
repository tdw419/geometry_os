; DESCRIPTION: Draws a purple rectangle at (67, 13) with width 59 and height 52.
; PLAN: r0=67(x), r1=13(y), r2=59(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 13
LDI r2, 59
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
