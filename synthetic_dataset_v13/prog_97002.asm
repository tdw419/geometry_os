; DESCRIPTION: Renders a magenta box of size 63x119 starting at (228, 131).
; PLAN: r0=228(x), r1=131(y), r2=63(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 131
LDI r2, 63
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
