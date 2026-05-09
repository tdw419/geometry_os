; DESCRIPTION: Creates a purple rectangular region at (177, 56) spanning 106 by 15 pixels.
; PLAN: r0=177(x), r1=56(y), r2=106(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 56
LDI r2, 106
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
