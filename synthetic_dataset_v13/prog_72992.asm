; DESCRIPTION: Creates a purple rectangular region at (141, 199) spanning 85 by 26 pixels.
; PLAN: r0=141(x), r1=199(y), r2=85(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 199
LDI r2, 85
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
