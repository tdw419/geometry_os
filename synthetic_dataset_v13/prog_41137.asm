; DESCRIPTION: Draws a blue rectangle at (33, 31) with width 35 and height 109.
; PLAN: r0=33(x), r1=31(y), r2=35(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 31
LDI r2, 35
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
