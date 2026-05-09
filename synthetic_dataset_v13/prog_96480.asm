; DESCRIPTION: Draws a red rectangle at (301, 55) with width 114 and height 102.
; PLAN: r0=301(x), r1=55(y), r2=114(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 55
LDI r2, 114
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
