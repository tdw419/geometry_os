; DESCRIPTION: Draws a red rectangle at (141, 174) with width 88 and height 28.
; PLAN: r0=141(x), r1=174(y), r2=88(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 174
LDI r2, 88
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
