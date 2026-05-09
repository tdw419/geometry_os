; DESCRIPTION: Renders a red box of size 60x89 starting at (379, 66).
; PLAN: r0=379(x), r1=66(y), r2=60(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 66
LDI r2, 60
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
