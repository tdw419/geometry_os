; DESCRIPTION: Draws a yellow rectangle at (145, 140) with width 10 and height 90.
; PLAN: r0=145(x), r1=140(y), r2=10(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 140
LDI r2, 10
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
