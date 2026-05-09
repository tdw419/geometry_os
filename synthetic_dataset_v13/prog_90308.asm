; DESCRIPTION: Draws a blue rectangle at (128, 96) with width 76 and height 55.
; PLAN: r0=128(x), r1=96(y), r2=76(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 96
LDI r2, 76
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
