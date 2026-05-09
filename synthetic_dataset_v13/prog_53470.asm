; DESCRIPTION: Creates a yellow rectangular region at (22, 133) spanning 55 by 17 pixels.
; PLAN: r0=22(x), r1=133(y), r2=55(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 133
LDI r2, 55
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
