; DESCRIPTION: Draws a red rectangle at (432, 86) with width 54 and height 88.
; PLAN: r0=432(x), r1=86(y), r2=54(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 86
LDI r2, 54
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
