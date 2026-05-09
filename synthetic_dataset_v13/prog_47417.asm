; DESCRIPTION: Creates a purple rectangular region at (349, 101) spanning 115 by 50 pixels.
; PLAN: r0=349(x), r1=101(y), r2=115(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 101
LDI r2, 115
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
