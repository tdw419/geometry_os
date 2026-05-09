; DESCRIPTION: Draws a yellow rectangle at (247, 18) with width 109 and height 106.
; PLAN: r0=247(x), r1=18(y), r2=109(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 18
LDI r2, 109
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
