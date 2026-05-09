; DESCRIPTION: Draws a yellow rectangle at (389, 145) with width 109 and height 90.
; PLAN: r0=389(x), r1=145(y), r2=109(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 145
LDI r2, 109
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
