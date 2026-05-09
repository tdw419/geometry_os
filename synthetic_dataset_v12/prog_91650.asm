; DESCRIPTION: Renders a magenta box of size 66x106 starting at (209, 81).
; PLAN: r0=209(x), r1=81(y), r2=66(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 81
LDI r2, 66
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
