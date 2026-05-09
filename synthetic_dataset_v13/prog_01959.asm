; DESCRIPTION: Renders a magenta box of size 109x97 starting at (193, 49).
; PLAN: r0=193(x), r1=49(y), r2=109(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 49
LDI r2, 109
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
