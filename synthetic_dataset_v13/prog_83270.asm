; DESCRIPTION: Draws a green rectangle at (8, 77) with width 71 and height 119.
; PLAN: r0=8(x), r1=77(y), r2=71(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 77
LDI r2, 71
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
