; DESCRIPTION: Draws a red rectangle at (35, 121) with width 62 and height 120.
; PLAN: r0=35(x), r1=121(y), r2=62(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 121
LDI r2, 62
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
