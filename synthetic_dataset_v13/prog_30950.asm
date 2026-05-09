; DESCRIPTION: Draws a blue rectangle at (181, 5) with width 96 and height 48.
; PLAN: r0=181(x), r1=5(y), r2=96(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 5
LDI r2, 96
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
