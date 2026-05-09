; DESCRIPTION: Creates a black rectangular region at (0, 48) spanning 17 by 92 pixels.
; PLAN: r0=0(x), r1=48(y), r2=17(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 48
LDI r2, 17
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
