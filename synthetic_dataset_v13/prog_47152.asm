; DESCRIPTION: Creates a black rectangular region at (314, 50) spanning 103 by 88 pixels.
; PLAN: r0=314(x), r1=50(y), r2=103(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 50
LDI r2, 103
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
