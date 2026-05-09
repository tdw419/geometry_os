; DESCRIPTION: Creates a purple rectangular region at (266, 56) spanning 53 by 58 pixels.
; PLAN: r0=266(x), r1=56(y), r2=53(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 56
LDI r2, 53
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
