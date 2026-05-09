; DESCRIPTION: Draws a red rectangle at (15, 194) with width 112 and height 36.
; PLAN: r0=15(x), r1=194(y), r2=112(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 194
LDI r2, 112
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
