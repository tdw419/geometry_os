; DESCRIPTION: Renders a magenta box of size 61x82 starting at (89, 77).
; PLAN: r0=89(x), r1=77(y), r2=61(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 77
LDI r2, 61
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
