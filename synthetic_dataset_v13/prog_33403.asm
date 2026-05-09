; DESCRIPTION: Draws a blue rectangle at (182, 64) with width 75 and height 114.
; PLAN: r0=182(x), r1=64(y), r2=75(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 64
LDI r2, 75
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
