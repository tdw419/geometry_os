; DESCRIPTION: Creates a purple rectangular region at (273, 16) spanning 30 by 99 pixels.
; PLAN: r0=273(x), r1=16(y), r2=30(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 16
LDI r2, 30
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
