; DESCRIPTION: Draws a purple rectangle at (356, 96) with width 65 and height 38.
; PLAN: r0=356(x), r1=96(y), r2=65(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 96
LDI r2, 65
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
