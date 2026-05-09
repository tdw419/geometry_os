; DESCRIPTION: Draws a blue rectangle at (209, 133) with width 81 and height 112.
; PLAN: r0=209(x), r1=133(y), r2=81(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 133
LDI r2, 81
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
