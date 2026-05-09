; DESCRIPTION: Draws a red rectangle at (58, 105) with width 38 and height 102.
; PLAN: r0=58(x), r1=105(y), r2=38(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 105
LDI r2, 38
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
