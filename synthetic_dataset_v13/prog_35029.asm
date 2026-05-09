; DESCRIPTION: Creates a purple rectangular region at (81, 186) spanning 101 by 29 pixels.
; PLAN: r0=81(x), r1=186(y), r2=101(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 186
LDI r2, 101
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
