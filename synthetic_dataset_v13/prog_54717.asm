; DESCRIPTION: Creates a yellow rectangular region at (343, 191) spanning 55 by 39 pixels.
; PLAN: r0=343(x), r1=191(y), r2=55(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 191
LDI r2, 55
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
