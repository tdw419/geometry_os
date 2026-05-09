; DESCRIPTION: Draws a red rectangle at (309, 19) with width 73 and height 71.
; PLAN: r0=309(x), r1=19(y), r2=73(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 19
LDI r2, 73
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
