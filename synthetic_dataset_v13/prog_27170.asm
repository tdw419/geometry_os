; DESCRIPTION: Renders a purple box of size 32x51 starting at (261, 130).
; PLAN: r0=261(x), r1=130(y), r2=32(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 130
LDI r2, 32
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
