; DESCRIPTION: Creates a purple rectangular region at (389, 148) spanning 61 by 57 pixels.
; PLAN: r0=389(x), r1=148(y), r2=61(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 148
LDI r2, 61
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
