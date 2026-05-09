; DESCRIPTION: Renders a red box of size 116x101 starting at (363, 120).
; PLAN: r0=363(x), r1=120(y), r2=116(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 120
LDI r2, 116
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
