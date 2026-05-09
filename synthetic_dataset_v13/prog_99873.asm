; DESCRIPTION: Renders a magenta box of size 61x89 starting at (408, 80).
; PLAN: r0=408(x), r1=80(y), r2=61(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 80
LDI r2, 61
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
