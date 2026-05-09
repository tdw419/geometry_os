; DESCRIPTION: Renders a yellow box of size 87x54 starting at (379, 55).
; PLAN: r0=379(x), r1=55(y), r2=87(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 55
LDI r2, 87
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
