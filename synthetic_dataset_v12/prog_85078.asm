; DESCRIPTION: Creates a purple rectangular region at (140, 82) spanning 33 by 70 pixels.
; PLAN: r0=140(x), r1=82(y), r2=33(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 82
LDI r2, 33
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
