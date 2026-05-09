; DESCRIPTION: Draws a yellow rectangle at (402, 107) with width 110 and height 107.
; PLAN: r0=402(x), r1=107(y), r2=110(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 107
LDI r2, 110
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
