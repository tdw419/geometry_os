; DESCRIPTION: Creates a black rectangular region at (10, 22) spanning 23 by 40 pixels.
; PLAN: r0=10(x), r1=22(y), r2=23(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 22
LDI r2, 23
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
