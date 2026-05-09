; DESCRIPTION: Renders a purple box of size 66x35 starting at (417, 66).
; PLAN: r0=417(x), r1=66(y), r2=66(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 66
LDI r2, 66
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
