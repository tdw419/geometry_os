; DESCRIPTION: Renders a purple box of size 10x72 starting at (472, 92).
; PLAN: r0=472(x), r1=92(y), r2=10(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 92
LDI r2, 10
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
