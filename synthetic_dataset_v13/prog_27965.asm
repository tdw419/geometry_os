; DESCRIPTION: Draws a black rectangle at (185, 97) with width 30 and height 14.
; PLAN: r0=185(x), r1=97(y), r2=30(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 97
LDI r2, 30
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
