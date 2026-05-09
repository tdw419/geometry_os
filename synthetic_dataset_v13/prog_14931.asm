; DESCRIPTION: Creates a purple rectangular region at (101, 89) spanning 23 by 84 pixels.
; PLAN: r0=101(x), r1=89(y), r2=23(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 89
LDI r2, 23
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
