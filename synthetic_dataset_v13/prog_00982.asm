; DESCRIPTION: Creates a yellow rectangular region at (338, 92) spanning 11 by 76 pixels.
; PLAN: r0=338(x), r1=92(y), r2=11(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 92
LDI r2, 11
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
