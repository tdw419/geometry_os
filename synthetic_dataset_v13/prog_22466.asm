; DESCRIPTION: Creates a black rectangular region at (34, 48) spanning 92 by 70 pixels.
; PLAN: r0=34(x), r1=48(y), r2=92(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 48
LDI r2, 92
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
