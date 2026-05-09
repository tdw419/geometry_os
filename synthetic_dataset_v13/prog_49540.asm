; DESCRIPTION: Draws a black rectangle at (26, 48) with width 97 and height 10.
; PLAN: r0=26(x), r1=48(y), r2=97(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 48
LDI r2, 97
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
