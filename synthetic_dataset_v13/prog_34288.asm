; DESCRIPTION: Creates a purple rectangular region at (12, 62) spanning 37 by 53 pixels.
; PLAN: r0=12(x), r1=62(y), r2=37(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 62
LDI r2, 37
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
