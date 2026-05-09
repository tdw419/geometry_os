; DESCRIPTION: Creates a yellow rectangular region at (288, 158) spanning 84 by 76 pixels.
; PLAN: r0=288(x), r1=158(y), r2=84(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 158
LDI r2, 84
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
