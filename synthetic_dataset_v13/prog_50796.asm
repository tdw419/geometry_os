; DESCRIPTION: Creates a white rectangular region at (423, 108) spanning 82 by 26 pixels.
; PLAN: r0=423(x), r1=108(y), r2=82(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 108
LDI r2, 82
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
