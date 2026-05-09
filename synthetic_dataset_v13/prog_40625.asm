; DESCRIPTION: Draws a yellow rectangle at (13, 85) with width 77 and height 96.
; PLAN: r0=13(x), r1=85(y), r2=77(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 85
LDI r2, 77
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
