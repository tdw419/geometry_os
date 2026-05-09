; DESCRIPTION: Renders a purple box of size 78x26 starting at (379, 141).
; PLAN: r0=379(x), r1=141(y), r2=78(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 141
LDI r2, 78
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
