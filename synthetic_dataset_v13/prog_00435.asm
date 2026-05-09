; DESCRIPTION: Draws a blue rectangle at (206, 62) with width 62 and height 100.
; PLAN: r0=206(x), r1=62(y), r2=62(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 62
LDI r2, 62
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
