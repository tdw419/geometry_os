; DESCRIPTION: Draws a green rectangle at (16, 212) with width 119 and height 28.
; PLAN: r0=16(x), r1=212(y), r2=119(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 212
LDI r2, 119
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
