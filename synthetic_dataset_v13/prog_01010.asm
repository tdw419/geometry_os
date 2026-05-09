; DESCRIPTION: Creates a green rectangular region at (52, 137) spanning 32 by 45 pixels.
; PLAN: r0=52(x), r1=137(y), r2=32(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 137
LDI r2, 32
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
