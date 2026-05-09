; DESCRIPTION: Creates a black rectangular region at (163, 91) spanning 51 by 75 pixels.
; PLAN: r0=163(x), r1=91(y), r2=51(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 91
LDI r2, 51
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
