; DESCRIPTION: Creates a purple rectangular region at (389, 95) spanning 36 by 117 pixels.
; PLAN: r0=389(x), r1=95(y), r2=36(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 95
LDI r2, 36
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
