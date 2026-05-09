; DESCRIPTION: Renders a purple box of size 118x84 starting at (351, 135).
; PLAN: r0=351(x), r1=135(y), r2=118(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 135
LDI r2, 118
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
