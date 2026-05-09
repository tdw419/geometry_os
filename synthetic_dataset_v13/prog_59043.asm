; DESCRIPTION: Draws a red rectangle at (363, 156) with width 96 and height 16.
; PLAN: r0=363(x), r1=156(y), r2=96(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 156
LDI r2, 96
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
