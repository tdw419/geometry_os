; DESCRIPTION: Creates a red rectangular region at (304, 170) spanning 110 by 85 pixels.
; PLAN: r0=304(x), r1=170(y), r2=110(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 170
LDI r2, 110
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
