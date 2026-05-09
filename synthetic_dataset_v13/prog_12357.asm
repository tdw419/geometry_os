; DESCRIPTION: Draws a red rectangle at (77, 6) with width 88 and height 20.
; PLAN: r0=77(x), r1=6(y), r2=88(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 6
LDI r2, 88
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
