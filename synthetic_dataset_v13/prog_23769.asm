; DESCRIPTION: Draws a yellow rectangle at (195, 95) with width 91 and height 69.
; PLAN: r0=195(x), r1=95(y), r2=91(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 95
LDI r2, 91
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
