; DESCRIPTION: Draws a black rectangle at (169, 46) with width 118 and height 50.
; PLAN: r0=169(x), r1=46(y), r2=118(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 46
LDI r2, 118
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
