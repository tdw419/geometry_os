; DESCRIPTION: Creates a purple rectangular region at (309, 26) spanning 110 by 34 pixels.
; PLAN: r0=309(x), r1=26(y), r2=110(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 26
LDI r2, 110
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
