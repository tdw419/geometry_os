; DESCRIPTION: Creates a black rectangular region at (377, 102) spanning 59 by 108 pixels.
; PLAN: r0=377(x), r1=102(y), r2=59(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 102
LDI r2, 59
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
