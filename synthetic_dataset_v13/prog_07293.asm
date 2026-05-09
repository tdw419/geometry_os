; DESCRIPTION: Creates a white rectangular region at (69, 74) spanning 102 by 49 pixels.
; PLAN: r0=69(x), r1=74(y), r2=102(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 74
LDI r2, 102
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
