; DESCRIPTION: Creates a black rectangular region at (238, 131) spanning 104 by 84 pixels.
; PLAN: r0=238(x), r1=131(y), r2=104(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 131
LDI r2, 104
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
