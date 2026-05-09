; DESCRIPTION: Draws a green rectangle at (154, 99) with width 102 and height 118.
; PLAN: r0=154(x), r1=99(y), r2=102(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 99
LDI r2, 102
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
