; DESCRIPTION: Renders a purple box of size 110x30 starting at (274, 43).
; PLAN: r0=274(x), r1=43(y), r2=110(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 43
LDI r2, 110
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
