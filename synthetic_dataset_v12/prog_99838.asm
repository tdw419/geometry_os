; DESCRIPTION: Renders a purple box of size 107x52 starting at (194, 26).
; PLAN: r0=194(x), r1=26(y), r2=107(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 26
LDI r2, 107
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
