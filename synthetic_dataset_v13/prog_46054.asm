; DESCRIPTION: Creates a purple rectangular region at (361, 60) spanning 73 by 118 pixels.
; PLAN: r0=361(x), r1=60(y), r2=73(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 60
LDI r2, 73
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
