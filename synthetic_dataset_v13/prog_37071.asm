; DESCRIPTION: Creates a purple rectangular region at (20, 31) spanning 52 by 11 pixels.
; PLAN: r0=20(x), r1=31(y), r2=52(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 31
LDI r2, 52
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
