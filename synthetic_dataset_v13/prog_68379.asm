; DESCRIPTION: Creates a yellow rectangular region at (35, 123) spanning 79 by 91 pixels.
; PLAN: r0=35(x), r1=123(y), r2=79(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 123
LDI r2, 79
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
