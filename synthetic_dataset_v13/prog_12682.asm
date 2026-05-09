; DESCRIPTION: Creates a yellow rectangular region at (289, 95) spanning 87 by 97 pixels.
; PLAN: r0=289(x), r1=95(y), r2=87(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 95
LDI r2, 87
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
