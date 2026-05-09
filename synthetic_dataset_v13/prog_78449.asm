; DESCRIPTION: Draws a blue rectangle at (216, 14) with width 50 and height 39.
; PLAN: r0=216(x), r1=14(y), r2=50(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 14
LDI r2, 50
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
