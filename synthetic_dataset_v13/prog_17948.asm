; DESCRIPTION: Draws a red rectangle at (6, 143) with width 66 and height 112.
; PLAN: r0=6(x), r1=143(y), r2=66(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 143
LDI r2, 66
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
