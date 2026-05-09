; DESCRIPTION: Renders a purple box of size 116x89 starting at (160, 83).
; PLAN: r0=160(x), r1=83(y), r2=116(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 83
LDI r2, 116
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
