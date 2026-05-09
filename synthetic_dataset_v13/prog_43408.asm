; DESCRIPTION: Creates a purple rectangular region at (233, 153) spanning 106 by 60 pixels.
; PLAN: r0=233(x), r1=153(y), r2=106(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 153
LDI r2, 106
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
