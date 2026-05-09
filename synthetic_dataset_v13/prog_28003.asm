; DESCRIPTION: Renders a magenta box of size 71x79 starting at (396, 134).
; PLAN: r0=396(x), r1=134(y), r2=71(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 134
LDI r2, 71
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
