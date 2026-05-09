; DESCRIPTION: Creates a black rectangular region at (161, 108) spanning 106 by 87 pixels.
; PLAN: r0=161(x), r1=108(y), r2=106(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 108
LDI r2, 106
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
