; DESCRIPTION: Draws a red rectangle at (99, 56) with width 87 and height 71.
; PLAN: r0=99(x), r1=56(y), r2=87(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 56
LDI r2, 87
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
