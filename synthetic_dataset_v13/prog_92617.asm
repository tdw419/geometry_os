; DESCRIPTION: Creates a yellow rectangular region at (390, 137) spanning 76 by 27 pixels.
; PLAN: r0=390(x), r1=137(y), r2=76(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 137
LDI r2, 76
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
