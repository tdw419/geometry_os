; DESCRIPTION: Creates a yellow rectangular region at (129, 149) spanning 97 by 85 pixels.
; PLAN: r0=129(x), r1=149(y), r2=97(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 149
LDI r2, 97
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
