; DESCRIPTION: Creates a black rectangular region at (108, 89) spanning 56 by 103 pixels.
; PLAN: r0=108(x), r1=89(y), r2=56(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 89
LDI r2, 56
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
