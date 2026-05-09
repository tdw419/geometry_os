; DESCRIPTION: Creates a black rectangular region at (233, 58) spanning 94 by 99 pixels.
; PLAN: r0=233(x), r1=58(y), r2=94(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 58
LDI r2, 94
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
