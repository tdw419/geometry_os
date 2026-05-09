; DESCRIPTION: Creates a red rectangular region at (437, 123) spanning 37 by 98 pixels.
; PLAN: r0=437(x), r1=123(y), r2=37(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 123
LDI r2, 37
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
