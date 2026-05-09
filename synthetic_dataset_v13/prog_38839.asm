; DESCRIPTION: Renders a magenta box of size 53x118 starting at (127, 138).
; PLAN: r0=127(x), r1=138(y), r2=53(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 138
LDI r2, 53
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
