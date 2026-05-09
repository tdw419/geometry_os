; DESCRIPTION: Renders a purple box of size 94x14 starting at (267, 89).
; PLAN: r0=267(x), r1=89(y), r2=94(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 89
LDI r2, 94
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
