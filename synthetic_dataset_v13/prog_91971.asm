; DESCRIPTION: Renders a purple box of size 116x82 starting at (6, 129).
; PLAN: r0=6(x), r1=129(y), r2=116(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 129
LDI r2, 116
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
