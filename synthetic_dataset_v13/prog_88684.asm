; DESCRIPTION: Draws a red rectangle at (7, 112) with width 112 and height 101.
; PLAN: r0=7(x), r1=112(y), r2=112(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 112
LDI r2, 112
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
