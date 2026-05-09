; DESCRIPTION: Creates a purple rectangular region at (153, 76) spanning 10 by 115 pixels.
; PLAN: r0=153(x), r1=76(y), r2=10(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 76
LDI r2, 10
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
