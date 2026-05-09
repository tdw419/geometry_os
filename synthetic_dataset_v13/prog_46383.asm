; DESCRIPTION: Creates a black rectangular region at (377, 75) spanning 89 by 72 pixels.
; PLAN: r0=377(x), r1=75(y), r2=89(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 75
LDI r2, 89
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
