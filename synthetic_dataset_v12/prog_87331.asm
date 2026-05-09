; DESCRIPTION: Creates a black rectangular region at (131, 214) spanning 89 by 25 pixels.
; PLAN: r0=131(x), r1=214(y), r2=89(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 214
LDI r2, 89
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
