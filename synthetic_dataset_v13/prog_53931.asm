; DESCRIPTION: Renders a purple box of size 106x31 starting at (44, 105).
; PLAN: r0=44(x), r1=105(y), r2=106(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 105
LDI r2, 106
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
