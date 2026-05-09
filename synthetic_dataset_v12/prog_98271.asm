; DESCRIPTION: Draws a red rectangle at (201, 133) with width 71 and height 74.
; PLAN: r0=201(x), r1=133(y), r2=71(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 133
LDI r2, 71
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
