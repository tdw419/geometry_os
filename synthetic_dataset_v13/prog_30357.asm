; DESCRIPTION: Renders a purple box of size 26x56 starting at (241, 45).
; PLAN: r0=241(x), r1=45(y), r2=26(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 45
LDI r2, 26
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
