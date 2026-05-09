; DESCRIPTION: Renders a blue box of size 58x93 starting at (382, 96).
; PLAN: r0=382(x), r1=96(y), r2=58(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 96
LDI r2, 58
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
