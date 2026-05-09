; DESCRIPTION: Renders a magenta box of size 84x35 starting at (216, 71).
; PLAN: r0=216(x), r1=71(y), r2=84(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 71
LDI r2, 84
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
