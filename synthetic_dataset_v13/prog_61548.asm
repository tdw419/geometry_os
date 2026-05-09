; DESCRIPTION: Creates a yellow rectangular region at (78, 188) spanning 10 by 58 pixels.
; PLAN: r0=78(x), r1=188(y), r2=10(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 188
LDI r2, 10
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
