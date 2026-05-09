; DESCRIPTION: Draws a red rectangle at (138, 30) with width 57 and height 112.
; PLAN: r0=138(x), r1=30(y), r2=57(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 30
LDI r2, 57
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
