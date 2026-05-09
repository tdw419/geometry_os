; DESCRIPTION: Renders a magenta box of size 73x78 starting at (122, 71).
; PLAN: r0=122(x), r1=71(y), r2=73(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 71
LDI r2, 73
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
