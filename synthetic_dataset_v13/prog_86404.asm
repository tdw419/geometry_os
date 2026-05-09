; DESCRIPTION: Draws a blue rectangle at (263, 105) with width 33 and height 79.
; PLAN: r0=263(x), r1=105(y), r2=33(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 105
LDI r2, 33
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
