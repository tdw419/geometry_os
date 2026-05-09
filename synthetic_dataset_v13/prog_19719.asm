; DESCRIPTION: Creates a purple rectangular region at (416, 123) spanning 84 by 47 pixels.
; PLAN: r0=416(x), r1=123(y), r2=84(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 123
LDI r2, 84
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
