; DESCRIPTION: Draws a blue rectangle at (260, 33) with width 88 and height 90.
; PLAN: r0=260(x), r1=33(y), r2=88(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 33
LDI r2, 88
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
