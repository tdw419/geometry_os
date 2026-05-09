; DESCRIPTION: Creates a purple rectangular region at (54, 53) spanning 35 by 35 pixels.
; PLAN: r0=54(x), r1=53(y), r2=35(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 53
LDI r2, 35
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
