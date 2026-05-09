; DESCRIPTION: Draws a blue rectangle at (260, 120) with width 22 and height 76.
; PLAN: r0=260(x), r1=120(y), r2=22(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 120
LDI r2, 22
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
