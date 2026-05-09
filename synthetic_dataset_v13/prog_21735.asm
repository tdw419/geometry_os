; DESCRIPTION: Renders a magenta box of size 114x94 starting at (389, 124).
; PLAN: r0=389(x), r1=124(y), r2=114(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 124
LDI r2, 114
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
