; DESCRIPTION: Draws a green rectangle at (52, 48) with width 49 and height 66.
; PLAN: r0=52(x), r1=48(y), r2=49(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 48
LDI r2, 49
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
