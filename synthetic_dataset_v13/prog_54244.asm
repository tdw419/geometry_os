; DESCRIPTION: Creates a yellow rectangular region at (314, 15) spanning 63 by 103 pixels.
; PLAN: r0=314(x), r1=15(y), r2=63(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 15
LDI r2, 63
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
