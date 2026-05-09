; DESCRIPTION: Draws a purple rectangle at (26, 107) with width 100 and height 12.
; PLAN: r0=26(x), r1=107(y), r2=100(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 107
LDI r2, 100
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
