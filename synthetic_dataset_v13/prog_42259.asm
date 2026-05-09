; DESCRIPTION: Creates a black rectangular region at (163, 119) spanning 75 by 57 pixels.
; PLAN: r0=163(x), r1=119(y), r2=75(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 119
LDI r2, 75
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
