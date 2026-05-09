; DESCRIPTION: Creates a white rectangular region at (0, 133) spanning 92 by 34 pixels.
; PLAN: r0=0(x), r1=133(y), r2=92(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 133
LDI r2, 92
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
