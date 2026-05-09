; DESCRIPTION: Creates a black rectangular region at (88, 6) spanning 54 by 30 pixels.
; PLAN: r0=88(x), r1=6(y), r2=54(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 6
LDI r2, 54
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
