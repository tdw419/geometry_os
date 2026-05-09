; DESCRIPTION: Creates a purple rectangular region at (65, 71) spanning 62 by 118 pixels.
; PLAN: r0=65(x), r1=71(y), r2=62(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 71
LDI r2, 62
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
