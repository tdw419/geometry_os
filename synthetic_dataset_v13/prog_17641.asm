; DESCRIPTION: Creates a white rectangular region at (219, 133) spanning 57 by 89 pixels.
; PLAN: r0=219(x), r1=133(y), r2=57(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 133
LDI r2, 57
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
