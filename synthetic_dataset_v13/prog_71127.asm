; DESCRIPTION: Renders a blue box of size 73x71 starting at (115, 23).
; PLAN: r0=115(x), r1=23(y), r2=73(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 23
LDI r2, 73
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
