; DESCRIPTION: Renders a purple box of size 62x91 starting at (201, 38).
; PLAN: r0=201(x), r1=38(y), r2=62(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 38
LDI r2, 62
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
