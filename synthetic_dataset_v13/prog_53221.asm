; DESCRIPTION: Creates a purple rectangular region at (430, 127) spanning 31 by 40 pixels.
; PLAN: r0=430(x), r1=127(y), r2=31(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 127
LDI r2, 31
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
