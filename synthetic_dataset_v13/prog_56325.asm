; DESCRIPTION: Draws a blue rectangle at (239, 56) with width 10 and height 62.
; PLAN: r0=239(x), r1=56(y), r2=10(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 56
LDI r2, 10
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
