; DESCRIPTION: Renders a purple box of size 11x86 starting at (501, 53).
; PLAN: r0=501(x), r1=53(y), r2=11(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 53
LDI r2, 11
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
