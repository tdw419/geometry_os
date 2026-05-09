; DESCRIPTION: Draws a red rectangle at (383, 55) with width 66 and height 85.
; PLAN: r0=383(x), r1=55(y), r2=66(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 55
LDI r2, 66
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
