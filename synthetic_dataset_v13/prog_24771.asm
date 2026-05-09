; DESCRIPTION: Renders a green box of size 113x36 starting at (379, 147).
; PLAN: r0=379(x), r1=147(y), r2=113(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 147
LDI r2, 113
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
