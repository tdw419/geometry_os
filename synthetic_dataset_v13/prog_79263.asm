; DESCRIPTION: Renders a magenta box of size 32x93 starting at (355, 106).
; PLAN: r0=355(x), r1=106(y), r2=32(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 106
LDI r2, 32
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
