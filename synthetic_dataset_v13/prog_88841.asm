; DESCRIPTION: Draws a blue rectangle at (387, 188) with width 71 and height 66.
; PLAN: r0=387(x), r1=188(y), r2=71(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 188
LDI r2, 71
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
