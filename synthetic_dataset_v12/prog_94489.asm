; DESCRIPTION: Creates a purple rectangular region at (194, 145) spanning 87 by 85 pixels.
; PLAN: r0=194(x), r1=145(y), r2=87(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 145
LDI r2, 87
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
