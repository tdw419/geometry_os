; DESCRIPTION: Creates a purple rectangular region at (33, 133) spanning 107 by 33 pixels.
; PLAN: r0=33(x), r1=133(y), r2=107(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 133
LDI r2, 107
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
