; DESCRIPTION: Draws a red rectangle at (136, 67) with width 31 and height 110.
; PLAN: r0=136(x), r1=67(y), r2=31(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 67
LDI r2, 31
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
