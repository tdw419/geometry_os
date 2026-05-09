; DESCRIPTION: Draws a green rectangle at (105, 37) with width 40 and height 58.
; PLAN: r0=105(x), r1=37(y), r2=40(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 37
LDI r2, 40
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
