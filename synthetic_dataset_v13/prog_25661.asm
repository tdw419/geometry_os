; DESCRIPTION: Draws a blue rectangle at (39, 135) with width 99 and height 64.
; PLAN: r0=39(x), r1=135(y), r2=99(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 135
LDI r2, 99
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
