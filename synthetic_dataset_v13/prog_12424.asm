; DESCRIPTION: Creates a white rectangular region at (337, 162) spanning 62 by 71 pixels.
; PLAN: r0=337(x), r1=162(y), r2=62(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 162
LDI r2, 62
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
