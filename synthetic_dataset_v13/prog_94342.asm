; DESCRIPTION: Renders a purple box of size 119x40 starting at (56, 119).
; PLAN: r0=56(x), r1=119(y), r2=119(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 119
LDI r2, 119
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
