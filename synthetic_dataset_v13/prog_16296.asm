; DESCRIPTION: Creates a purple rectangular region at (318, 31) spanning 71 by 77 pixels.
; PLAN: r0=318(x), r1=31(y), r2=71(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 31
LDI r2, 71
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
