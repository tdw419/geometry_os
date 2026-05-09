; DESCRIPTION: Creates a white rectangular region at (325, 39) spanning 59 by 118 pixels.
; PLAN: r0=325(x), r1=39(y), r2=59(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 39
LDI r2, 59
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
