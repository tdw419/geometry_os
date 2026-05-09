; DESCRIPTION: Renders a purple box of size 58x11 starting at (89, 20).
; PLAN: r0=89(x), r1=20(y), r2=58(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 20
LDI r2, 58
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
