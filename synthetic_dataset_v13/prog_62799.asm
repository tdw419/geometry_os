; DESCRIPTION: Creates a purple rectangular region at (40, 82) spanning 117 by 15 pixels.
; PLAN: r0=40(x), r1=82(y), r2=117(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 82
LDI r2, 117
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
