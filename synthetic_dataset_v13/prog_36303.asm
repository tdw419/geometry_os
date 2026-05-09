; DESCRIPTION: Draws a blue rectangle at (4, 137) with width 57 and height 33.
; PLAN: r0=4(x), r1=137(y), r2=57(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 137
LDI r2, 57
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
