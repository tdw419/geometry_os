; DESCRIPTION: Draws a blue rectangle at (137, 140) with width 54 and height 32.
; PLAN: r0=137(x), r1=140(y), r2=54(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 140
LDI r2, 54
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
