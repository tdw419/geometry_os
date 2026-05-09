; DESCRIPTION: Creates a purple rectangular region at (152, 137) spanning 81 by 102 pixels.
; PLAN: r0=152(x), r1=137(y), r2=81(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 137
LDI r2, 81
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
