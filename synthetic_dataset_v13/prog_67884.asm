; DESCRIPTION: Creates a purple rectangular region at (365, 119) spanning 114 by 52 pixels.
; PLAN: r0=365(x), r1=119(y), r2=114(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 119
LDI r2, 114
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
