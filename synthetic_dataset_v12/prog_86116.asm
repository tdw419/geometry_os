; DESCRIPTION: Draws a yellow rectangle at (169, 79) with width 67 and height 94.
; PLAN: r0=169(x), r1=79(y), r2=67(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 79
LDI r2, 67
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
