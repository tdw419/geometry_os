; DESCRIPTION: Creates a purple rectangular region at (102, 13) spanning 79 by 55 pixels.
; PLAN: r0=102(x), r1=13(y), r2=79(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 13
LDI r2, 79
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
