; DESCRIPTION: Draws a green rectangle at (172, 107) with width 23 and height 119.
; PLAN: r0=172(x), r1=107(y), r2=23(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 107
LDI r2, 23
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
