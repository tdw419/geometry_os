; DESCRIPTION: Renders a purple box of size 100x34 starting at (201, 213).
; PLAN: r0=201(x), r1=213(y), r2=100(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 213
LDI r2, 100
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
