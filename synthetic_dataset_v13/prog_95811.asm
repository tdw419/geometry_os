; DESCRIPTION: Renders a purple box of size 34x77 starting at (476, 169).
; PLAN: r0=476(x), r1=169(y), r2=34(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 169
LDI r2, 34
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
