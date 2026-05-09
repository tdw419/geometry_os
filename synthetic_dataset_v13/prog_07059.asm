; DESCRIPTION: Draws a green rectangle at (201, 23) with width 20 and height 67.
; PLAN: r0=201(x), r1=23(y), r2=20(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 23
LDI r2, 20
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
