; DESCRIPTION: Renders a purple box of size 36x105 starting at (139, 87).
; PLAN: r0=139(x), r1=87(y), r2=36(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 87
LDI r2, 36
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
