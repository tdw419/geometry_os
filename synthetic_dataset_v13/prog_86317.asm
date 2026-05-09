; DESCRIPTION: Creates a purple rectangular region at (217, 137) spanning 20 by 61 pixels.
; PLAN: r0=217(x), r1=137(y), r2=20(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 137
LDI r2, 20
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
