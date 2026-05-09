; DESCRIPTION: Creates a purple rectangular region at (97, 80) spanning 112 by 55 pixels.
; PLAN: r0=97(x), r1=80(y), r2=112(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 80
LDI r2, 112
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
