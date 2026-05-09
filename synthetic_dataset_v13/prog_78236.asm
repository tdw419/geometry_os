; DESCRIPTION: Renders a purple box of size 64x29 starting at (97, 107).
; PLAN: r0=97(x), r1=107(y), r2=64(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 107
LDI r2, 64
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
