; DESCRIPTION: Creates a purple rectangular region at (12, 40) spanning 115 by 79 pixels.
; PLAN: r0=12(x), r1=40(y), r2=115(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 40
LDI r2, 115
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
