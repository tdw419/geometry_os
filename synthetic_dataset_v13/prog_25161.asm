; DESCRIPTION: Creates a green rectangular region at (272, 137) spanning 56 by 38 pixels.
; PLAN: r0=272(x), r1=137(y), r2=56(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 137
LDI r2, 56
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
