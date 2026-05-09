; DESCRIPTION: Creates a purple rectangular region at (347, 77) spanning 87 by 86 pixels.
; PLAN: r0=347(x), r1=77(y), r2=87(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 77
LDI r2, 87
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
