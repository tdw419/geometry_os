; DESCRIPTION: Renders a purple box of size 79x99 starting at (347, 20).
; PLAN: r0=347(x), r1=20(y), r2=79(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 20
LDI r2, 79
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
