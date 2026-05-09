; DESCRIPTION: Draws a blue rectangle at (179, 185) with width 19 and height 28.
; PLAN: r0=179(x), r1=185(y), r2=19(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 185
LDI r2, 19
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
