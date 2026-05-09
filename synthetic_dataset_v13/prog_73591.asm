; DESCRIPTION: Renders a green box of size 23x73 starting at (379, 76).
; PLAN: r0=379(x), r1=76(y), r2=23(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 76
LDI r2, 23
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
