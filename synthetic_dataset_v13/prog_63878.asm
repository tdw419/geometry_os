; DESCRIPTION: Draws a purple rectangle at (352, 216) with width 28 and height 16.
; PLAN: r0=352(x), r1=216(y), r2=28(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 216
LDI r2, 28
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
