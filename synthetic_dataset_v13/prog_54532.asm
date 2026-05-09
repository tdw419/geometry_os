; DESCRIPTION: Creates a yellow rectangular region at (123, 102) spanning 87 by 19 pixels.
; PLAN: r0=123(x), r1=102(y), r2=87(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 102
LDI r2, 87
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
