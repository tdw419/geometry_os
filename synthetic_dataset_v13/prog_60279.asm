; DESCRIPTION: Creates a purple rectangular region at (316, 82) spanning 35 by 33 pixels.
; PLAN: r0=316(x), r1=82(y), r2=35(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 82
LDI r2, 35
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
