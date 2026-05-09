; DESCRIPTION: Creates a purple rectangular region at (73, 102) spanning 91 by 106 pixels.
; PLAN: r0=73(x), r1=102(y), r2=91(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 102
LDI r2, 91
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
