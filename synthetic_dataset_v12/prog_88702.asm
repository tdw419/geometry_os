; DESCRIPTION: Creates a white rectangular region at (238, 52) spanning 59 by 58 pixels.
; PLAN: r0=238(x), r1=52(y), r2=59(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 52
LDI r2, 59
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
