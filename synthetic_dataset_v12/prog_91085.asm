; DESCRIPTION: Draws a green rectangle at (133, 102) with width 36 and height 87.
; PLAN: r0=133(x), r1=102(y), r2=36(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 102
LDI r2, 36
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
