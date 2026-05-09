; DESCRIPTION: Creates a purple rectangular region at (118, 71) spanning 56 by 93 pixels.
; PLAN: r0=118(x), r1=71(y), r2=56(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 71
LDI r2, 56
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
