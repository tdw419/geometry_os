; DESCRIPTION: Draws a yellow rectangle at (345, 49) with width 66 and height 109.
; PLAN: r0=345(x), r1=49(y), r2=66(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 49
LDI r2, 66
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
