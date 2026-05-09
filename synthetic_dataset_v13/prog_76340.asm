; DESCRIPTION: Creates a purple rectangular region at (315, 118) spanning 38 by 81 pixels.
; PLAN: r0=315(x), r1=118(y), r2=38(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 118
LDI r2, 38
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
