; DESCRIPTION: Creates a white rectangular region at (210, 99) spanning 53 by 115 pixels.
; PLAN: r0=210(x), r1=99(y), r2=53(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 99
LDI r2, 53
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
