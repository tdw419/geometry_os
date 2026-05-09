; DESCRIPTION: Draws a red rectangle at (189, 100) with width 56 and height 79.
; PLAN: r0=189(x), r1=100(y), r2=56(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 100
LDI r2, 56
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
