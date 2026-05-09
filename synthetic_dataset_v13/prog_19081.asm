; DESCRIPTION: Creates a black rectangular region at (136, 18) spanning 20 by 34 pixels.
; PLAN: r0=136(x), r1=18(y), r2=20(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 18
LDI r2, 20
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
