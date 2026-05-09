; DESCRIPTION: Creates a white rectangular region at (11, 38) spanning 99 by 28 pixels.
; PLAN: r0=11(x), r1=38(y), r2=99(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 38
LDI r2, 99
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
