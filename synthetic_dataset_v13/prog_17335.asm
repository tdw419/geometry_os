; DESCRIPTION: Renders a purple box of size 62x79 starting at (311, 50).
; PLAN: r0=311(x), r1=50(y), r2=62(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 50
LDI r2, 62
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
