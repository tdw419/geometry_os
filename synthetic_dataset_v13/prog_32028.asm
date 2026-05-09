; DESCRIPTION: Creates a red rectangular region at (373, 102) spanning 25 by 38 pixels.
; PLAN: r0=373(x), r1=102(y), r2=25(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 102
LDI r2, 25
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
