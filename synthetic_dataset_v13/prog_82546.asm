; DESCRIPTION: Creates a purple rectangular region at (334, 31) spanning 40 by 75 pixels.
; PLAN: r0=334(x), r1=31(y), r2=40(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 31
LDI r2, 40
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
