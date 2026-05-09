; DESCRIPTION: Creates a black rectangular region at (162, 133) spanning 88 by 57 pixels.
; PLAN: r0=162(x), r1=133(y), r2=88(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 133
LDI r2, 88
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
