; DESCRIPTION: Renders a purple box of size 88x107 starting at (125, 96).
; PLAN: r0=125(x), r1=96(y), r2=88(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 96
LDI r2, 88
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
