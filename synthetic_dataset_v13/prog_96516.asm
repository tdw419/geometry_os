; DESCRIPTION: Draws a red rectangle at (266, 141) with width 71 and height 30.
; PLAN: r0=266(x), r1=141(y), r2=71(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 141
LDI r2, 71
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
