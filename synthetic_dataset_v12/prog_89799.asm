; DESCRIPTION: Draws a green rectangle at (270, 87) with width 48 and height 74.
; PLAN: r0=270(x), r1=87(y), r2=48(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 87
LDI r2, 48
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
