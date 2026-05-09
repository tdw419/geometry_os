; DESCRIPTION: Draws a blue rectangle at (159, 16) with width 56 and height 46.
; PLAN: r0=159(x), r1=16(y), r2=56(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 16
LDI r2, 56
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
