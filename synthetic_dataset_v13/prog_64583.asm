; DESCRIPTION: Draws a green rectangle at (290, 8) with width 94 and height 40.
; PLAN: r0=290(x), r1=8(y), r2=94(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 8
LDI r2, 94
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
