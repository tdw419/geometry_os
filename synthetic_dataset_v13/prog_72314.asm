; DESCRIPTION: Renders a magenta box of size 66x84 starting at (36, 141).
; PLAN: r0=36(x), r1=141(y), r2=66(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 141
LDI r2, 66
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
