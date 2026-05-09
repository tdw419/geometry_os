; DESCRIPTION: Creates a white rectangular region at (133, 108) spanning 23 by 89 pixels.
; PLAN: r0=133(x), r1=108(y), r2=23(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 108
LDI r2, 23
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
