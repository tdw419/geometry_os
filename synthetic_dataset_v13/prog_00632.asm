; DESCRIPTION: Creates a purple rectangular region at (416, 122) spanning 46 by 80 pixels.
; PLAN: r0=416(x), r1=122(y), r2=46(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 122
LDI r2, 46
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
