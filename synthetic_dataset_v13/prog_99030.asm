; DESCRIPTION: Creates a yellow rectangular region at (416, 63) spanning 43 by 119 pixels.
; PLAN: r0=416(x), r1=63(y), r2=43(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 63
LDI r2, 43
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
