; DESCRIPTION: Draws a red rectangle at (414, 116) with width 56 and height 92.
; PLAN: r0=414(x), r1=116(y), r2=56(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 116
LDI r2, 56
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
