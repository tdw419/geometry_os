; DESCRIPTION: Renders a purple box of size 109x112 starting at (92, 49).
; PLAN: r0=92(x), r1=49(y), r2=109(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 49
LDI r2, 109
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
