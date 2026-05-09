; DESCRIPTION: Draws a blue rectangle at (165, 80) with width 64 and height 99.
; PLAN: r0=165(x), r1=80(y), r2=64(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 80
LDI r2, 64
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
