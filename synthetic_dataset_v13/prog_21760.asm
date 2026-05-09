; DESCRIPTION: Renders a magenta box of size 100x61 starting at (80, 15).
; PLAN: r0=80(x), r1=15(y), r2=100(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 15
LDI r2, 100
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
