; DESCRIPTION: Draws a blue rectangle at (352, 135) with width 79 and height 58.
; PLAN: r0=352(x), r1=135(y), r2=79(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 135
LDI r2, 79
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
