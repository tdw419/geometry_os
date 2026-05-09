; DESCRIPTION: Creates a purple rectangular region at (331, 137) spanning 34 by 42 pixels.
; PLAN: r0=331(x), r1=137(y), r2=34(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 137
LDI r2, 34
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
