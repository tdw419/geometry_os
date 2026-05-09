; DESCRIPTION: Draws a blue rectangle at (72, 64) with width 13 and height 99.
; PLAN: r0=72(x), r1=64(y), r2=13(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 64
LDI r2, 13
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
