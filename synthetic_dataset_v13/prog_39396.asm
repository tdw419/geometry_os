; DESCRIPTION: Draws a red rectangle at (266, 37) with width 73 and height 22.
; PLAN: r0=266(x), r1=37(y), r2=73(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 37
LDI r2, 73
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
