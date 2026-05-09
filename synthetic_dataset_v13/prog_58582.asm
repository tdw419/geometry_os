; DESCRIPTION: Draws a blue rectangle at (7, 106) with width 95 and height 107.
; PLAN: r0=7(x), r1=106(y), r2=95(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 106
LDI r2, 95
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
