; DESCRIPTION: Creates a purple rectangular region at (89, 29) spanning 76 by 84 pixels.
; PLAN: r0=89(x), r1=29(y), r2=76(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 29
LDI r2, 76
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
