; DESCRIPTION: Draws a blue rectangle at (44, 19) with width 103 and height 73.
; PLAN: r0=44(x), r1=19(y), r2=103(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 19
LDI r2, 103
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
