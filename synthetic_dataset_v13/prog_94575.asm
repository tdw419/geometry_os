; DESCRIPTION: Creates a purple rectangular region at (93, 101) spanning 61 by 81 pixels.
; PLAN: r0=93(x), r1=101(y), r2=61(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 101
LDI r2, 61
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
