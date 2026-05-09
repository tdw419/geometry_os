; DESCRIPTION: Creates a black rectangular region at (331, 161) spanning 59 by 82 pixels.
; PLAN: r0=331(x), r1=161(y), r2=59(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 161
LDI r2, 59
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
