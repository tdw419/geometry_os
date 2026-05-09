; DESCRIPTION: Draws a red rectangle at (15, 37) with width 22 and height 29.
; PLAN: r0=15(x), r1=37(y), r2=22(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 37
LDI r2, 22
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
