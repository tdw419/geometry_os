; DESCRIPTION: Creates a black rectangular region at (385, 52) spanning 36 by 103 pixels.
; PLAN: r0=385(x), r1=52(y), r2=36(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 52
LDI r2, 36
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
