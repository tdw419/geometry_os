; DESCRIPTION: Creates a black rectangular region at (22, 3) spanning 117 by 58 pixels.
; PLAN: r0=22(x), r1=3(y), r2=117(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 3
LDI r2, 117
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
