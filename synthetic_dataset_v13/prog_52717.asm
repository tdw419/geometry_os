; DESCRIPTION: Creates a purple rectangular region at (449, 90) spanning 46 by 110 pixels.
; PLAN: r0=449(x), r1=90(y), r2=46(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 90
LDI r2, 46
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
