; DESCRIPTION: Creates a purple rectangular region at (253, 102) spanning 54 by 101 pixels.
; PLAN: r0=253(x), r1=102(y), r2=54(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 102
LDI r2, 54
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
