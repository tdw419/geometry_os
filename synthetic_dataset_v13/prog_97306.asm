; DESCRIPTION: Creates a white rectangular region at (123, 147) spanning 69 by 102 pixels.
; PLAN: r0=123(x), r1=147(y), r2=69(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 147
LDI r2, 69
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
