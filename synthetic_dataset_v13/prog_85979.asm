; DESCRIPTION: Creates a purple rectangular region at (217, 145) spanning 99 by 90 pixels.
; PLAN: r0=217(x), r1=145(y), r2=99(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 145
LDI r2, 99
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
