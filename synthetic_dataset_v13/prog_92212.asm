; DESCRIPTION: Creates a purple rectangular region at (153, 52) spanning 87 by 17 pixels.
; PLAN: r0=153(x), r1=52(y), r2=87(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 52
LDI r2, 87
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
