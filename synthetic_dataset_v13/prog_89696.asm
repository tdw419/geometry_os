; DESCRIPTION: Draws a red rectangle at (184, 144) with width 116 and height 106.
; PLAN: r0=184(x), r1=144(y), r2=116(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 144
LDI r2, 116
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
