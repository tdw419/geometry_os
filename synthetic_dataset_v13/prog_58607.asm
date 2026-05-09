; DESCRIPTION: Creates a yellow rectangular region at (10, 133) spanning 97 by 23 pixels.
; PLAN: r0=10(x), r1=133(y), r2=97(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 133
LDI r2, 97
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
