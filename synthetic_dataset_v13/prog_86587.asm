; DESCRIPTION: Draws a green rectangle at (119, 32) with width 110 and height 27.
; PLAN: r0=119(x), r1=32(y), r2=110(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 32
LDI r2, 110
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
