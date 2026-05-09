; DESCRIPTION: Creates a yellow rectangular region at (411, 133) spanning 57 by 34 pixels.
; PLAN: r0=411(x), r1=133(y), r2=57(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 133
LDI r2, 57
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
