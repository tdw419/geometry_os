; DESCRIPTION: Draws a purple rectangle at (320, 40) with width 88 and height 16.
; PLAN: r0=320(x), r1=40(y), r2=88(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 40
LDI r2, 88
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
