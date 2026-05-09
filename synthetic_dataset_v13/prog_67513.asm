; DESCRIPTION: Creates a white rectangular region at (299, 59) spanning 115 by 55 pixels.
; PLAN: r0=299(x), r1=59(y), r2=115(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 59
LDI r2, 115
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
