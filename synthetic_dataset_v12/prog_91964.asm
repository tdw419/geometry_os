; DESCRIPTION: Creates a green rectangular region at (458, 3) spanning 46 by 97 pixels.
; PLAN: r0=458(x), r1=3(y), r2=46(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 3
LDI r2, 46
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
