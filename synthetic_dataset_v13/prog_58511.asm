; DESCRIPTION: Draws a blue rectangle at (5, 63) with width 81 and height 48.
; PLAN: r0=5(x), r1=63(y), r2=81(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 63
LDI r2, 81
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
