; DESCRIPTION: Creates a white rectangular region at (141, 141) spanning 15 by 87 pixels.
; PLAN: r0=141(x), r1=141(y), r2=15(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 141
LDI r2, 15
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
