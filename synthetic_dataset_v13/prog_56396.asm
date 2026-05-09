; DESCRIPTION: Creates a black rectangular region at (405, 17) spanning 19 by 92 pixels.
; PLAN: r0=405(x), r1=17(y), r2=19(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 17
LDI r2, 19
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
