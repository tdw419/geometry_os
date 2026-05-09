; DESCRIPTION: Draws a green rectangle at (152, 87) with width 54 and height 114.
; PLAN: r0=152(x), r1=87(y), r2=54(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 87
LDI r2, 54
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
