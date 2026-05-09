; DESCRIPTION: Draws a blue rectangle at (307, 14) with width 96 and height 112.
; PLAN: r0=307(x), r1=14(y), r2=96(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 14
LDI r2, 96
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
