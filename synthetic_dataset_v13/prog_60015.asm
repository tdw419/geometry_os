; DESCRIPTION: Renders a yellow box of size 106x36 starting at (379, 145).
; PLAN: r0=379(x), r1=145(y), r2=106(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 145
LDI r2, 106
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
