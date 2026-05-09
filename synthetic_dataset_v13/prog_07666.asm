; DESCRIPTION: Renders a purple box of size 23x66 starting at (257, 34).
; PLAN: r0=257(x), r1=34(y), r2=23(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 34
LDI r2, 23
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
