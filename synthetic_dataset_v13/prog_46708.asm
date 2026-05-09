; DESCRIPTION: Draws a black rectangle at (99, 112) with width 90 and height 54.
; PLAN: r0=99(x), r1=112(y), r2=90(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 112
LDI r2, 90
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
