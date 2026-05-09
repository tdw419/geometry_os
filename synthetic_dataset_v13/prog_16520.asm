; DESCRIPTION: Creates a yellow rectangular region at (53, 191) spanning 62 by 33 pixels.
; PLAN: r0=53(x), r1=191(y), r2=62(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 191
LDI r2, 62
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
