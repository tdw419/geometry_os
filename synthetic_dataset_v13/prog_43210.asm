; DESCRIPTION: Creates a white rectangular region at (452, 102) spanning 44 by 53 pixels.
; PLAN: r0=452(x), r1=102(y), r2=44(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 102
LDI r2, 44
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
