; DESCRIPTION: Renders a magenta box of size 100x94 starting at (168, 156).
; PLAN: r0=168(x), r1=156(y), r2=100(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 156
LDI r2, 100
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
