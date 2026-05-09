; DESCRIPTION: Creates a green rectangular region at (131, 137) spanning 63 by 112 pixels.
; PLAN: r0=131(x), r1=137(y), r2=63(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 137
LDI r2, 63
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
