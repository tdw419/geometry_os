; DESCRIPTION: Draws a green rectangle at (10, 68) with width 29 and height 40.
; PLAN: r0=10(x), r1=68(y), r2=29(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 68
LDI r2, 29
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
