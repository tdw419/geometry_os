; DESCRIPTION: Draws a green rectangle at (30, 200) with width 13 and height 18.
; PLAN: r0=30(x), r1=200(y), r2=13(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 200
LDI r2, 13
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
