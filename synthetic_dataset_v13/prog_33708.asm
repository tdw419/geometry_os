; DESCRIPTION: Creates a purple rectangular region at (371, 30) spanning 110 by 23 pixels.
; PLAN: r0=371(x), r1=30(y), r2=110(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 30
LDI r2, 110
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
