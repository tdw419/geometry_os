; DESCRIPTION: Creates a purple rectangular region at (254, 81) spanning 55 by 87 pixels.
; PLAN: r0=254(x), r1=81(y), r2=55(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 81
LDI r2, 55
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
