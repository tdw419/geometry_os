; DESCRIPTION: Renders a magenta box of size 24x15 starting at (471, 36).
; PLAN: r0=471(x), r1=36(y), r2=24(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 36
LDI r2, 24
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
