; DESCRIPTION: Creates a yellow rectangular region at (115, 21) spanning 83 by 102 pixels.
; PLAN: r0=115(x), r1=21(y), r2=83(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 21
LDI r2, 83
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
