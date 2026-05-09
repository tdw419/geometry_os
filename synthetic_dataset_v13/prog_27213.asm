; DESCRIPTION: Draws a red rectangle at (233, 121) with width 102 and height 73.
; PLAN: r0=233(x), r1=121(y), r2=102(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 121
LDI r2, 102
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
