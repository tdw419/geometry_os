; DESCRIPTION: Draws a red rectangle at (24, 75) with width 102 and height 28.
; PLAN: r0=24(x), r1=75(y), r2=102(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 75
LDI r2, 102
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
