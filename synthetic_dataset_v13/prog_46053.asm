; DESCRIPTION: Draws a yellow rectangle at (169, 117) with width 79 and height 107.
; PLAN: r0=169(x), r1=117(y), r2=79(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 117
LDI r2, 79
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
