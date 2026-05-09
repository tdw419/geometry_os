; DESCRIPTION: Draws a red rectangle at (116, 105) with width 64 and height 89.
; PLAN: r0=116(x), r1=105(y), r2=64(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 105
LDI r2, 64
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
