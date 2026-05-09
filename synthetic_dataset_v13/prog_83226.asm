; DESCRIPTION: Creates a purple rectangular region at (182, 100) spanning 94 by 66 pixels.
; PLAN: r0=182(x), r1=100(y), r2=94(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 100
LDI r2, 94
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
