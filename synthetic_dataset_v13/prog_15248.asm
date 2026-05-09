; DESCRIPTION: Creates a purple rectangular region at (83, 156) spanning 49 by 16 pixels.
; PLAN: r0=83(x), r1=156(y), r2=49(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 156
LDI r2, 49
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
