; DESCRIPTION: Renders a green box of size 109x20 starting at (388, 116).
; PLAN: r0=388(x), r1=116(y), r2=109(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 116
LDI r2, 109
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
