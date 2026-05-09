; DESCRIPTION: Creates a purple rectangular region at (388, 165) spanning 53 by 78 pixels.
; PLAN: r0=388(x), r1=165(y), r2=53(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 165
LDI r2, 53
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
