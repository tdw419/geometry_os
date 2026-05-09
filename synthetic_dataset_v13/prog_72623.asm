; DESCRIPTION: Creates a purple rectangular region at (55, 183) spanning 106 by 54 pixels.
; PLAN: r0=55(x), r1=183(y), r2=106(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 183
LDI r2, 106
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
