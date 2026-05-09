; DESCRIPTION: Creates a purple rectangular region at (309, 133) spanning 22 by 115 pixels.
; PLAN: r0=309(x), r1=133(y), r2=22(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 133
LDI r2, 22
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
