; DESCRIPTION: Renders a purple box of size 105x19 starting at (194, 172).
; PLAN: r0=194(x), r1=172(y), r2=105(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 172
LDI r2, 105
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
