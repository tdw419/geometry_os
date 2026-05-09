; DESCRIPTION: Draws a purple rectangle at (171, 140) with width 44 and height 89.
; PLAN: r0=171(x), r1=140(y), r2=44(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 140
LDI r2, 44
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
