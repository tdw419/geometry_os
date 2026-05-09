; DESCRIPTION: Creates a green rectangular region at (382, 137) spanning 40 by 64 pixels.
; PLAN: r0=382(x), r1=137(y), r2=40(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 137
LDI r2, 40
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
