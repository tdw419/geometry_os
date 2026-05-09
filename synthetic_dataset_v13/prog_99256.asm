; DESCRIPTION: Renders a blue box of size 43x56 starting at (73, 71).
; PLAN: r0=73(x), r1=71(y), r2=43(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 71
LDI r2, 43
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
