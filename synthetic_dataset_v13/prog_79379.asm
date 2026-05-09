; DESCRIPTION: Creates a blue rectangular region at (236, 46) spanning 62 by 97 pixels.
; PLAN: r0=236(x), r1=46(y), r2=62(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 46
LDI r2, 62
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
