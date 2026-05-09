; DESCRIPTION: Draws a red rectangle at (142, 122) with width 115 and height 89.
; PLAN: r0=142(x), r1=122(y), r2=115(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 122
LDI r2, 115
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
