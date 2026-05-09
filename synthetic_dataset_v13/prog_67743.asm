; DESCRIPTION: Creates a purple rectangular region at (321, 192) spanning 97 by 33 pixels.
; PLAN: r0=321(x), r1=192(y), r2=97(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 192
LDI r2, 97
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
