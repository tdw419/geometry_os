; DESCRIPTION: Creates a purple rectangular region at (153, 71) spanning 93 by 101 pixels.
; PLAN: r0=153(x), r1=71(y), r2=93(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 71
LDI r2, 93
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
