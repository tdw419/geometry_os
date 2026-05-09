; DESCRIPTION: Draws a blue rectangle at (66, 18) with width 48 and height 37.
; PLAN: r0=66(x), r1=18(y), r2=48(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 18
LDI r2, 48
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
