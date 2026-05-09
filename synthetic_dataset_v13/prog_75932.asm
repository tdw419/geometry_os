; DESCRIPTION: Draws a purple rectangle at (413, 147) with width 77 and height 51.
; PLAN: r0=413(x), r1=147(y), r2=77(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 147
LDI r2, 77
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
