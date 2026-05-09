; DESCRIPTION: Draws a red rectangle at (247, 102) with width 14 and height 85.
; PLAN: r0=247(x), r1=102(y), r2=14(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 102
LDI r2, 14
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
