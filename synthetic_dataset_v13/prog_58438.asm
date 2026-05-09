; DESCRIPTION: Creates a purple rectangular region at (131, 100) spanning 68 by 105 pixels.
; PLAN: r0=131(x), r1=100(y), r2=68(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 100
LDI r2, 68
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
