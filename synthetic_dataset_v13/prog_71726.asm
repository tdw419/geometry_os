; DESCRIPTION: Draws a green rectangle at (105, 154) with width 10 and height 99.
; PLAN: r0=105(x), r1=154(y), r2=10(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 154
LDI r2, 10
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
