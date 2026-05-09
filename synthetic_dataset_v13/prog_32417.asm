; DESCRIPTION: Creates a black rectangular region at (221, 158) spanning 45 by 92 pixels.
; PLAN: r0=221(x), r1=158(y), r2=45(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 158
LDI r2, 45
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
