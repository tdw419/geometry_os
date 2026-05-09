; DESCRIPTION: Creates a black rectangular region at (12, 31) spanning 47 by 38 pixels.
; PLAN: r0=12(x), r1=31(y), r2=47(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 31
LDI r2, 47
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
