; DESCRIPTION: Renders a purple box of size 115x13 starting at (148, 45).
; PLAN: r0=148(x), r1=45(y), r2=115(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 45
LDI r2, 115
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
