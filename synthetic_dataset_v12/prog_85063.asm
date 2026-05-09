; DESCRIPTION: Renders a green box of size 35x110 starting at (379, 68).
; PLAN: r0=379(x), r1=68(y), r2=35(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 68
LDI r2, 35
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
