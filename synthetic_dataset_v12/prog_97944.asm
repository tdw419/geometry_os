; DESCRIPTION: Renders a blue box of size 71x58 starting at (382, 116).
; PLAN: r0=382(x), r1=116(y), r2=71(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 116
LDI r2, 71
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
