; DESCRIPTION: Draws a blue rectangle at (231, 56) with width 111 and height 96.
; PLAN: r0=231(x), r1=56(y), r2=111(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 56
LDI r2, 111
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
