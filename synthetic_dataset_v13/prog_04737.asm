; DESCRIPTION: Creates a purple rectangular region at (402, 102) spanning 102 by 61 pixels.
; PLAN: r0=402(x), r1=102(y), r2=102(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 102
LDI r2, 102
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
