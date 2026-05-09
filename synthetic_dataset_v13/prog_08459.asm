; DESCRIPTION: Draws a yellow rectangle at (100, 148) with width 94 and height 79.
; PLAN: r0=100(x), r1=148(y), r2=94(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 148
LDI r2, 94
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
