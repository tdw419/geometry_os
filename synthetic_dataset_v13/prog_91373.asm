; DESCRIPTION: Draws a blue rectangle at (33, 72) with width 110 and height 109.
; PLAN: r0=33(x), r1=72(y), r2=110(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 72
LDI r2, 110
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
