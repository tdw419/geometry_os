; DESCRIPTION: Renders a purple box of size 110x98 starting at (131, 45).
; PLAN: r0=131(x), r1=45(y), r2=110(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 45
LDI r2, 110
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
