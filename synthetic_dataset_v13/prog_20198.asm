; DESCRIPTION: Draws a blue rectangle at (133, 10) with width 79 and height 64.
; PLAN: r0=133(x), r1=10(y), r2=79(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 10
LDI r2, 79
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
