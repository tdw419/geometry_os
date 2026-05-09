; DESCRIPTION: Draws a purple rectangle at (322, 89) with width 100 and height 32.
; PLAN: r0=322(x), r1=89(y), r2=100(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 89
LDI r2, 100
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
