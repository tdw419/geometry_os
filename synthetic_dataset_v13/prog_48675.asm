; DESCRIPTION: Draws a blue rectangle at (182, 235) with width 89 and height 14.
; PLAN: r0=182(x), r1=235(y), r2=89(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 235
LDI r2, 89
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
