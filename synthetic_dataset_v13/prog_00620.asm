; DESCRIPTION: Renders a magenta box of size 31x52 starting at (85, 64).
; PLAN: r0=85(x), r1=64(y), r2=31(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 64
LDI r2, 31
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
