; DESCRIPTION: Creates a black rectangular region at (325, 121) spanning 98 by 111 pixels.
; PLAN: r0=325(x), r1=121(y), r2=98(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 121
LDI r2, 98
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
