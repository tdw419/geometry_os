; DESCRIPTION: Creates a black rectangular region at (463, 102) spanning 26 by 115 pixels.
; PLAN: r0=463(x), r1=102(y), r2=26(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 102
LDI r2, 26
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
