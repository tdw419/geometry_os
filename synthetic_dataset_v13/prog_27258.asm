; DESCRIPTION: Draws a red rectangle at (24, 11) with width 102 and height 84.
; PLAN: r0=24(x), r1=11(y), r2=102(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 11
LDI r2, 102
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
