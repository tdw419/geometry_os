; DESCRIPTION: Renders a magenta box of size 93x85 starting at (363, 7).
; PLAN: r0=363(x), r1=7(y), r2=93(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 7
LDI r2, 93
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
