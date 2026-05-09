; DESCRIPTION: Draws a blue rectangle at (198, 143) with width 58 and height 88.
; PLAN: r0=198(x), r1=143(y), r2=58(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 143
LDI r2, 58
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
