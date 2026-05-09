; DESCRIPTION: Creates a purple rectangular region at (281, 110) spanning 89 by 60 pixels.
; PLAN: r0=281(x), r1=110(y), r2=89(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 110
LDI r2, 89
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
