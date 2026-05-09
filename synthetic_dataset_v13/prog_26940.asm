; DESCRIPTION: Draws a yellow rectangle at (247, 97) with width 31 and height 107.
; PLAN: r0=247(x), r1=97(y), r2=31(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 97
LDI r2, 31
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
