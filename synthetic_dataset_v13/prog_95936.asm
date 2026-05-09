; DESCRIPTION: Creates a purple rectangular region at (195, 24) spanning 118 by 43 pixels.
; PLAN: r0=195(x), r1=24(y), r2=118(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 24
LDI r2, 118
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
