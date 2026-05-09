; DESCRIPTION: Renders a magenta box of size 77x80 starting at (191, 61).
; PLAN: r0=191(x), r1=61(y), r2=77(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 61
LDI r2, 77
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
