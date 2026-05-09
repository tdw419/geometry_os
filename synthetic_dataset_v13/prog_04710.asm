; DESCRIPTION: Creates a black rectangular region at (27, 123) spanning 69 by 77 pixels.
; PLAN: r0=27(x), r1=123(y), r2=69(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 123
LDI r2, 69
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
