; DESCRIPTION: Creates a purple rectangular region at (388, 121) spanning 73 by 63 pixels.
; PLAN: r0=388(x), r1=121(y), r2=73(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 121
LDI r2, 73
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
