; DESCRIPTION: Creates a black rectangular region at (161, 7) spanning 108 by 102 pixels.
; PLAN: r0=161(x), r1=7(y), r2=108(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 7
LDI r2, 108
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
