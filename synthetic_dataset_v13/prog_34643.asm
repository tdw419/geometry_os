; DESCRIPTION: Creates a black rectangular region at (9, 62) spanning 65 by 92 pixels.
; PLAN: r0=9(x), r1=62(y), r2=65(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 62
LDI r2, 65
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
