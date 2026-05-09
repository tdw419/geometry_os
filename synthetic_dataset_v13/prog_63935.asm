; DESCRIPTION: Creates a black rectangular region at (61, 147) spanning 53 by 103 pixels.
; PLAN: r0=61(x), r1=147(y), r2=53(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 147
LDI r2, 53
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
