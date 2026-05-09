; DESCRIPTION: Creates a yellow rectangular region at (452, 80) spanning 24 by 87 pixels.
; PLAN: r0=452(x), r1=80(y), r2=24(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 80
LDI r2, 24
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
