; DESCRIPTION: Creates a yellow rectangular region at (141, 174) spanning 97 by 65 pixels.
; PLAN: r0=141(x), r1=174(y), r2=97(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 174
LDI r2, 97
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
