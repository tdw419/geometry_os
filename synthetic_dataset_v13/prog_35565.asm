; DESCRIPTION: Creates a purple rectangular region at (430, 180) spanning 73 by 31 pixels.
; PLAN: r0=430(x), r1=180(y), r2=73(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 180
LDI r2, 73
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
