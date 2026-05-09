; DESCRIPTION: Renders a magenta box of size 109x75 starting at (62, 61).
; PLAN: r0=62(x), r1=61(y), r2=109(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 61
LDI r2, 109
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
