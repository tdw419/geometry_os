; DESCRIPTION: Draws a green rectangle at (105, 23) with width 101 and height 27.
; PLAN: r0=105(x), r1=23(y), r2=101(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 23
LDI r2, 101
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
