; DESCRIPTION: Creates a black rectangular region at (233, 187) spanning 101 by 22 pixels.
; PLAN: r0=233(x), r1=187(y), r2=101(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 187
LDI r2, 101
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
