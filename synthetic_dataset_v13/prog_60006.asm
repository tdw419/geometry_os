; DESCRIPTION: Renders a magenta box of size 96x108 starting at (14, 138).
; PLAN: r0=14(x), r1=138(y), r2=96(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 138
LDI r2, 96
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
