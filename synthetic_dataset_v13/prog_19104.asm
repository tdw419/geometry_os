; DESCRIPTION: Renders a purple box of size 57x89 starting at (31, 64).
; PLAN: r0=31(x), r1=64(y), r2=57(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 64
LDI r2, 57
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
