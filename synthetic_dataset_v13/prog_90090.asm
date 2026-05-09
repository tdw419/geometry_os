; DESCRIPTION: Renders a purple box of size 19x53 starting at (31, 87).
; PLAN: r0=31(x), r1=87(y), r2=19(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 87
LDI r2, 19
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
