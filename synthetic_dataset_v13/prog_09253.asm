; DESCRIPTION: Creates a purple rectangular region at (379, 40) spanning 66 by 75 pixels.
; PLAN: r0=379(x), r1=40(y), r2=66(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 40
LDI r2, 66
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
