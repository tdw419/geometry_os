; DESCRIPTION: Creates a purple rectangular region at (256, 132) spanning 35 by 89 pixels.
; PLAN: r0=256(x), r1=132(y), r2=35(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 132
LDI r2, 35
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
