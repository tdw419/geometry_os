; DESCRIPTION: Draws a blue rectangle at (70, 90) with width 11 and height 66.
; PLAN: r0=70(x), r1=90(y), r2=11(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 90
LDI r2, 11
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
