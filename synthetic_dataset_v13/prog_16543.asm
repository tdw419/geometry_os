; DESCRIPTION: Renders a purple box of size 63x89 starting at (44, 57).
; PLAN: r0=44(x), r1=57(y), r2=63(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 57
LDI r2, 63
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
