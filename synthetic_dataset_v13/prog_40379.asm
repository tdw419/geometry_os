; DESCRIPTION: Creates a purple rectangular region at (341, 94) spanning 79 by 78 pixels.
; PLAN: r0=341(x), r1=94(y), r2=79(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 94
LDI r2, 79
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
