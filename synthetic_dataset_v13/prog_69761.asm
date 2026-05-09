; DESCRIPTION: Draws a red rectangle at (112, 18) with width 106 and height 39.
; PLAN: r0=112(x), r1=18(y), r2=106(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 18
LDI r2, 106
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
