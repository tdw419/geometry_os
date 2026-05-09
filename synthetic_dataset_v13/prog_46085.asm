; DESCRIPTION: Draws a blue rectangle at (449, 196) with width 62 and height 46.
; PLAN: r0=449(x), r1=196(y), r2=62(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 196
LDI r2, 62
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
