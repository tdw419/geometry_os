; DESCRIPTION: Creates a purple rectangular region at (450, 137) spanning 13 by 89 pixels.
; PLAN: r0=450(x), r1=137(y), r2=13(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 137
LDI r2, 13
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
