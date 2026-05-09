; DESCRIPTION: Renders a magenta box of size 112x45 starting at (109, 168).
; PLAN: r0=109(x), r1=168(y), r2=112(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 168
LDI r2, 112
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
