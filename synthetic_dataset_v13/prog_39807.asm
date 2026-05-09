; DESCRIPTION: Draws a blue rectangle at (60, 222) with width 62 and height 29.
; PLAN: r0=60(x), r1=222(y), r2=62(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 222
LDI r2, 62
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
