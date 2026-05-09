; DESCRIPTION: Creates a black rectangular region at (70, 158) spanning 102 by 57 pixels.
; PLAN: r0=70(x), r1=158(y), r2=102(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 158
LDI r2, 102
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
