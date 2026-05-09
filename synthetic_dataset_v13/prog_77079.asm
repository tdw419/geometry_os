; DESCRIPTION: Creates a purple rectangular region at (319, 104) spanning 85 by 61 pixels.
; PLAN: r0=319(x), r1=104(y), r2=85(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 104
LDI r2, 85
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
