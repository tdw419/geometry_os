; DESCRIPTION: Renders a purple box of size 14x57 starting at (379, 97).
; PLAN: r0=379(x), r1=97(y), r2=14(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 97
LDI r2, 14
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
