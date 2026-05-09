; DESCRIPTION: Draws a yellow rectangle at (126, 91) with width 106 and height 58.
; PLAN: r0=126(x), r1=91(y), r2=106(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 91
LDI r2, 106
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
