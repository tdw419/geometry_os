; DESCRIPTION: Draws a red rectangle at (291, 155) with width 112 and height 47.
; PLAN: r0=291(x), r1=155(y), r2=112(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 155
LDI r2, 112
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
