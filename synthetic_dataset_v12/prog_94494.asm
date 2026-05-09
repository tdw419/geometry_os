; DESCRIPTION: Renders a purple box of size 39x100 starting at (119, 132).
; PLAN: r0=119(x), r1=132(y), r2=39(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 132
LDI r2, 39
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
