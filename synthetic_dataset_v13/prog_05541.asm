; DESCRIPTION: Creates a white rectangular region at (158, 133) spanning 48 by 70 pixels.
; PLAN: r0=158(x), r1=133(y), r2=48(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 133
LDI r2, 48
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
