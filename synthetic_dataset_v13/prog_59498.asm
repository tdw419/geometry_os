; DESCRIPTION: Renders a purple box of size 116x24 starting at (47, 218).
; PLAN: r0=47(x), r1=218(y), r2=116(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 218
LDI r2, 116
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
