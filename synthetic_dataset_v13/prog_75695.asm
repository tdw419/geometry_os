; DESCRIPTION: Creates a black rectangular region at (58, 98) spanning 54 by 102 pixels.
; PLAN: r0=58(x), r1=98(y), r2=54(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 98
LDI r2, 54
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
