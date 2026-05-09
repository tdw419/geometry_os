; DESCRIPTION: Creates a yellow rectangular region at (321, 174) spanning 87 by 72 pixels.
; PLAN: r0=321(x), r1=174(y), r2=87(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 174
LDI r2, 87
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
