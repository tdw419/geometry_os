; DESCRIPTION: Creates a yellow rectangular region at (312, 176) spanning 115 by 10 pixels.
; PLAN: r0=312(x), r1=176(y), r2=115(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 176
LDI r2, 115
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
