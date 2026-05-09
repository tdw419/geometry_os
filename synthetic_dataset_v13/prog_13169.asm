; DESCRIPTION: Creates a black rectangular region at (387, 78) spanning 94 by 101 pixels.
; PLAN: r0=387(x), r1=78(y), r2=94(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 78
LDI r2, 94
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
