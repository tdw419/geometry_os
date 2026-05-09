; DESCRIPTION: Draws a black rectangle at (211, 97) with width 87 and height 50.
; PLAN: r0=211(x), r1=97(y), r2=87(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 97
LDI r2, 87
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
