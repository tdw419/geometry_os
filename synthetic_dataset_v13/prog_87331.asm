; DESCRIPTION: Renders a purple box of size 92x114 starting at (256, 96).
; PLAN: r0=256(x), r1=96(y), r2=92(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 96
LDI r2, 92
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
