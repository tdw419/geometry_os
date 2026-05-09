; DESCRIPTION: Draws a black rectangle at (195, 103) with width 13 and height 118.
; PLAN: r0=195(x), r1=103(y), r2=13(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 103
LDI r2, 13
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
