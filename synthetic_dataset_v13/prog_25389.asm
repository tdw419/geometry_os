; DESCRIPTION: Draws a red rectangle at (260, 77) with width 84 and height 112.
; PLAN: r0=260(x), r1=77(y), r2=84(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 77
LDI r2, 84
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
