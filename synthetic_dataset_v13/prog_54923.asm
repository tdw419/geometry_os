; DESCRIPTION: Renders a purple box of size 35x19 starting at (107, 22).
; PLAN: r0=107(x), r1=22(y), r2=35(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 22
LDI r2, 35
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
