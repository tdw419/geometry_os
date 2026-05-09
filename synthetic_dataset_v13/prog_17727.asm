; DESCRIPTION: Draws a red rectangle at (227, 137) with width 87 and height 102.
; PLAN: r0=227(x), r1=137(y), r2=87(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 137
LDI r2, 87
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
