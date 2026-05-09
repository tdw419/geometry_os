; DESCRIPTION: Renders a purple box of size 46x101 starting at (407, 96).
; PLAN: r0=407(x), r1=96(y), r2=46(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 96
LDI r2, 46
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
