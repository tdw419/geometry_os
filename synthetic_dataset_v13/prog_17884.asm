; DESCRIPTION: Creates a yellow rectangular region at (3, 144) spanning 97 by 109 pixels.
; PLAN: r0=3(x), r1=144(y), r2=97(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 144
LDI r2, 97
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
