; DESCRIPTION: Creates a white rectangular region at (230, 123) spanning 10 by 26 pixels.
; PLAN: r0=230(x), r1=123(y), r2=10(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 123
LDI r2, 10
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
