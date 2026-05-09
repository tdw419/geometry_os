; DESCRIPTION: Draws a red rectangle at (12, 72) with width 116 and height 56.
; PLAN: r0=12(x), r1=72(y), r2=116(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 72
LDI r2, 116
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
