; DESCRIPTION: Creates a purple rectangular region at (37, 149) spanning 119 by 85 pixels.
; PLAN: r0=37(x), r1=149(y), r2=119(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 149
LDI r2, 119
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
