; DESCRIPTION: Renders a magenta box of size 79x114 starting at (155, 117).
; PLAN: r0=155(x), r1=117(y), r2=79(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 117
LDI r2, 79
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
