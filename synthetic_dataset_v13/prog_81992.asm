; DESCRIPTION: Creates a purple rectangular region at (90, 110) spanning 56 by 109 pixels.
; PLAN: r0=90(x), r1=110(y), r2=56(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 110
LDI r2, 56
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
