; DESCRIPTION: Renders a purple box of size 96x51 starting at (289, 24).
; PLAN: r0=289(x), r1=24(y), r2=96(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 24
LDI r2, 96
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
