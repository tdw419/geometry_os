; DESCRIPTION: Renders a purple box of size 105x112 starting at (112, 43).
; PLAN: r0=112(x), r1=43(y), r2=105(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 43
LDI r2, 105
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
