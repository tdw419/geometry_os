; DESCRIPTION: Renders a purple box of size 11x76 starting at (347, 53).
; PLAN: r0=347(x), r1=53(y), r2=11(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 53
LDI r2, 11
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
