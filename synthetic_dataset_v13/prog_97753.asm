; DESCRIPTION: Renders a purple box of size 60x112 starting at (293, 107).
; PLAN: r0=293(x), r1=107(y), r2=60(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 107
LDI r2, 60
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
