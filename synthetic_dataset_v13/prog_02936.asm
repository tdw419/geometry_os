; DESCRIPTION: Draws a blue rectangle at (60, 11) with width 87 and height 15.
; PLAN: r0=60(x), r1=11(y), r2=87(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 11
LDI r2, 87
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
