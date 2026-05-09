; DESCRIPTION: Draws a red rectangle at (24, 26) with width 56 and height 87.
; PLAN: r0=24(x), r1=26(y), r2=56(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 26
LDI r2, 56
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
