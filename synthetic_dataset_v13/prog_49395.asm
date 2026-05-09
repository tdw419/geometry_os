; DESCRIPTION: Creates a purple rectangular region at (297, 121) spanning 58 by 79 pixels.
; PLAN: r0=297(x), r1=121(y), r2=58(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 121
LDI r2, 58
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
