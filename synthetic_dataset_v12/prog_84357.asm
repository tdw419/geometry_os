; DESCRIPTION: Creates a yellow rectangular region at (140, 91) spanning 35 by 13 pixels.
; PLAN: r0=140(x), r1=91(y), r2=35(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 91
LDI r2, 35
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
