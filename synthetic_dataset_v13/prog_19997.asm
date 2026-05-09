; DESCRIPTION: Renders a magenta box of size 50x89 starting at (413, 116).
; PLAN: r0=413(x), r1=116(y), r2=50(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 116
LDI r2, 50
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
