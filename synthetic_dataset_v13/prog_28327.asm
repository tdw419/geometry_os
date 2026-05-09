; DESCRIPTION: Creates a yellow rectangular region at (383, 113) spanning 24 by 54 pixels.
; PLAN: r0=383(x), r1=113(y), r2=24(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 113
LDI r2, 24
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
