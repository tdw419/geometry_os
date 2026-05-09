; DESCRIPTION: Creates a black rectangular region at (418, 133) spanning 74 by 105 pixels.
; PLAN: r0=418(x), r1=133(y), r2=74(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 133
LDI r2, 74
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
