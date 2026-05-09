; DESCRIPTION: Creates a white rectangular region at (260, 133) spanning 15 by 108 pixels.
; PLAN: r0=260(x), r1=133(y), r2=15(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 133
LDI r2, 15
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
