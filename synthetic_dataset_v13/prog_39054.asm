; DESCRIPTION: Draws a black rectangle at (435, 106) with width 46 and height 66.
; PLAN: r0=435(x), r1=106(y), r2=46(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 106
LDI r2, 46
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
