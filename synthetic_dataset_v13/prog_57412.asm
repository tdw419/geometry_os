; DESCRIPTION: Draws a green rectangle at (303, 40) with width 106 and height 58.
; PLAN: r0=303(x), r1=40(y), r2=106(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 40
LDI r2, 106
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
