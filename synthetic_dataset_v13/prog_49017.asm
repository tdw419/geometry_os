; DESCRIPTION: Creates a black rectangular region at (108, 57) spanning 55 by 35 pixels.
; PLAN: r0=108(x), r1=57(y), r2=55(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 57
LDI r2, 55
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
