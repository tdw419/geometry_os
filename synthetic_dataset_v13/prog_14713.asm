; DESCRIPTION: Renders a blue box of size 112x115 starting at (379, 77).
; PLAN: r0=379(x), r1=77(y), r2=112(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 77
LDI r2, 112
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
