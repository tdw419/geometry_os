; DESCRIPTION: Renders a purple box of size 116x61 starting at (227, 72).
; PLAN: r0=227(x), r1=72(y), r2=116(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 72
LDI r2, 116
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
