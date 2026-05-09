; DESCRIPTION: Draws a red rectangle at (176, 155) with width 116 and height 24.
; PLAN: r0=176(x), r1=155(y), r2=116(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 155
LDI r2, 116
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
