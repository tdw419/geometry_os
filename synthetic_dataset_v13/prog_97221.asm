; DESCRIPTION: Draws a red rectangle at (22, 62) with width 66 and height 119.
; PLAN: r0=22(x), r1=62(y), r2=66(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 62
LDI r2, 66
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
