; DESCRIPTION: Renders a green box of size 49x29 starting at (379, 81).
; PLAN: r0=379(x), r1=81(y), r2=49(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 81
LDI r2, 49
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
