; DESCRIPTION: Renders a green box of size 57x31 starting at (379, 186).
; PLAN: r0=379(x), r1=186(y), r2=57(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 186
LDI r2, 57
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
