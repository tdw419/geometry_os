; DESCRIPTION: Creates a white rectangular region at (389, 58) spanning 21 by 108 pixels.
; PLAN: r0=389(x), r1=58(y), r2=21(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 58
LDI r2, 21
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
