; DESCRIPTION: Renders a purple box of size 102x58 starting at (201, 95).
; PLAN: r0=201(x), r1=95(y), r2=102(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 95
LDI r2, 102
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
