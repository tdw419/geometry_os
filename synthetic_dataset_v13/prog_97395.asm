; DESCRIPTION: Draws a red rectangle at (5, 110) with width 71 and height 68.
; PLAN: r0=5(x), r1=110(y), r2=71(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 110
LDI r2, 71
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
