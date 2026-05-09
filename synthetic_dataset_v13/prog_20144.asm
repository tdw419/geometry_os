; DESCRIPTION: Creates a black rectangular region at (369, 191) spanning 38 by 49 pixels.
; PLAN: r0=369(x), r1=191(y), r2=38(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 191
LDI r2, 38
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
