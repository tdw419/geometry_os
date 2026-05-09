; DESCRIPTION: Creates a yellow rectangular region at (272, 2) spanning 73 by 31 pixels.
; PLAN: r0=272(x), r1=2(y), r2=73(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 2
LDI r2, 73
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
