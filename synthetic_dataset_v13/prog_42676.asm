; DESCRIPTION: Draws a red rectangle at (408, 80) with width 74 and height 116.
; PLAN: r0=408(x), r1=80(y), r2=74(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 80
LDI r2, 74
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
