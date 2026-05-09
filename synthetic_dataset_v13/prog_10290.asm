; DESCRIPTION: Renders a blue box of size 85x71 starting at (414, 93).
; PLAN: r0=414(x), r1=93(y), r2=85(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 93
LDI r2, 85
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
