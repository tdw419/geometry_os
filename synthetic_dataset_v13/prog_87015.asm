; DESCRIPTION: Renders a purple box of size 31x87 starting at (345, 64).
; PLAN: r0=345(x), r1=64(y), r2=31(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 64
LDI r2, 31
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
