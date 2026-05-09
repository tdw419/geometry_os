; DESCRIPTION: Renders a yellow box of size 78x75 starting at (379, 83).
; PLAN: r0=379(x), r1=83(y), r2=78(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 83
LDI r2, 78
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
