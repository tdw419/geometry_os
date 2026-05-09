; DESCRIPTION: Draws a blue rectangle at (178, 10) with width 85 and height 81.
; PLAN: r0=178(x), r1=10(y), r2=85(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 10
LDI r2, 85
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
