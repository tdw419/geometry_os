; DESCRIPTION: Creates a white rectangular region at (311, 102) spanning 33 by 102 pixels.
; PLAN: r0=311(x), r1=102(y), r2=33(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 102
LDI r2, 33
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
