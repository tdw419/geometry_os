; DESCRIPTION: Creates a purple rectangular region at (221, 156) spanning 26 by 33 pixels.
; PLAN: r0=221(x), r1=156(y), r2=26(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 156
LDI r2, 26
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
