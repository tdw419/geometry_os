; DESCRIPTION: Creates a purple rectangular region at (212, 141) spanning 23 by 81 pixels.
; PLAN: r0=212(x), r1=141(y), r2=23(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 141
LDI r2, 23
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
