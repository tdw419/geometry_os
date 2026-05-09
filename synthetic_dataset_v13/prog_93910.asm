; DESCRIPTION: Renders a purple box of size 81x76 starting at (431, 148).
; PLAN: r0=431(x), r1=148(y), r2=81(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 148
LDI r2, 81
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
