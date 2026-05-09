; DESCRIPTION: Draws a blue rectangle at (260, 87) with width 100 and height 93.
; PLAN: r0=260(x), r1=87(y), r2=100(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 87
LDI r2, 100
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
