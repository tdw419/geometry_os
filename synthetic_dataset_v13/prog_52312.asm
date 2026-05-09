; DESCRIPTION: Creates a black rectangular region at (266, 24) spanning 47 by 54 pixels.
; PLAN: r0=266(x), r1=24(y), r2=47(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 24
LDI r2, 47
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
