; DESCRIPTION: Draws a green rectangle at (112, 24) with width 29 and height 49.
; PLAN: r0=112(x), r1=24(y), r2=29(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 24
LDI r2, 29
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
