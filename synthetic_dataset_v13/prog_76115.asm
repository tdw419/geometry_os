; DESCRIPTION: Creates a purple rectangular region at (288, 35) spanning 89 by 86 pixels.
; PLAN: r0=288(x), r1=35(y), r2=89(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 35
LDI r2, 89
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
