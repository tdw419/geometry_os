; DESCRIPTION: Creates a purple rectangular region at (190, 142) spanning 52 by 11 pixels.
; PLAN: r0=190(x), r1=142(y), r2=52(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 142
LDI r2, 52
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
