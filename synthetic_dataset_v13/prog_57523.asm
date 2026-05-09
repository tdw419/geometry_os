; DESCRIPTION: Renders a purple box of size 78x112 starting at (347, 96).
; PLAN: r0=347(x), r1=96(y), r2=78(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 96
LDI r2, 78
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
