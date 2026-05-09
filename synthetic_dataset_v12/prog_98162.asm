; DESCRIPTION: Draws a red rectangle at (105, 0) with width 119 and height 119.
; PLAN: r0=105(x), r1=0(y), r2=119(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 0
LDI r2, 119
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
