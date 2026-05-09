; DESCRIPTION: Creates a white rectangular region at (355, 133) spanning 70 by 64 pixels.
; PLAN: r0=355(x), r1=133(y), r2=70(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 133
LDI r2, 70
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
