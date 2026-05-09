; DESCRIPTION: Renders a magenta box of size 18x71 starting at (14, 99).
; PLAN: r0=14(x), r1=99(y), r2=18(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 99
LDI r2, 18
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
