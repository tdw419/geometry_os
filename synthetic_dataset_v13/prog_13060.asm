; DESCRIPTION: Creates a purple rectangular region at (27, 1) spanning 118 by 98 pixels.
; PLAN: r0=27(x), r1=1(y), r2=118(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 1
LDI r2, 118
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
