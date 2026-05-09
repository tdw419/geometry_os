; DESCRIPTION: Creates a black rectangular region at (31, 191) spanning 52 by 10 pixels.
; PLAN: r0=31(x), r1=191(y), r2=52(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 191
LDI r2, 52
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
