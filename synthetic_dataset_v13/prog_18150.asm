; DESCRIPTION: Draws a blue rectangle at (2, 75) with width 107 and height 100.
; PLAN: r0=2(x), r1=75(y), r2=107(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 75
LDI r2, 107
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
