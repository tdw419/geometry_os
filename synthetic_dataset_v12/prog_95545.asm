; DESCRIPTION: Creates a purple rectangular region at (416, 29) spanning 59 by 101 pixels.
; PLAN: r0=416(x), r1=29(y), r2=59(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 29
LDI r2, 59
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
