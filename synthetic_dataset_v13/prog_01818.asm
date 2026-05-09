; DESCRIPTION: Draws a blue rectangle at (280, 121) with width 96 and height 36.
; PLAN: r0=280(x), r1=121(y), r2=96(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 121
LDI r2, 96
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
