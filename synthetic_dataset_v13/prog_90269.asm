; DESCRIPTION: Creates a purple rectangular region at (396, 95) spanning 57 by 70 pixels.
; PLAN: r0=396(x), r1=95(y), r2=57(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 95
LDI r2, 57
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
