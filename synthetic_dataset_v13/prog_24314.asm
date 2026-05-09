; DESCRIPTION: Renders a green box of size 116x96 starting at (363, 88).
; PLAN: r0=363(x), r1=88(y), r2=116(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 88
LDI r2, 116
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
