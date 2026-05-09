; DESCRIPTION: Renders a purple box of size 109x92 starting at (34, 133).
; PLAN: r0=34(x), r1=133(y), r2=109(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 133
LDI r2, 109
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
