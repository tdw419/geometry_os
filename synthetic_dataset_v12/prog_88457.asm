; DESCRIPTION: Draws a red rectangle at (19, 109) with width 11 and height 89.
; PLAN: r0=19(x), r1=109(y), r2=11(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 109
LDI r2, 11
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
