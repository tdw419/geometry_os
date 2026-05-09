; DESCRIPTION: Draws a purple rectangle at (141, 180) with width 77 and height 51.
; PLAN: r0=141(x), r1=180(y), r2=77(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 180
LDI r2, 77
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
