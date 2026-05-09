; DESCRIPTION: Draws a red rectangle at (379, 62) with width 106 and height 87.
; PLAN: r0=379(x), r1=62(y), r2=106(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 62
LDI r2, 106
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
