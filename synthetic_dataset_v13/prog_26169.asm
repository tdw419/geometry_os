; DESCRIPTION: Creates a white rectangular region at (226, 46) spanning 115 by 35 pixels.
; PLAN: r0=226(x), r1=46(y), r2=115(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 46
LDI r2, 115
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
