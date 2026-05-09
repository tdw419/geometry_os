; DESCRIPTION: Draws a blue rectangle at (283, 181) with width 12 and height 33.
; PLAN: r0=283(x), r1=181(y), r2=12(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 181
LDI r2, 12
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
