; DESCRIPTION: Renders a purple box of size 55x112 starting at (325, 23).
; PLAN: r0=325(x), r1=23(y), r2=55(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 23
LDI r2, 55
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
