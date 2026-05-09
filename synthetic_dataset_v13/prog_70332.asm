; DESCRIPTION: Draws a purple rectangle at (352, 153) with width 67 and height 39.
; PLAN: r0=352(x), r1=153(y), r2=67(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 153
LDI r2, 67
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
