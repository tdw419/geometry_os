; DESCRIPTION: Creates a yellow rectangular region at (34, 18) spanning 85 by 96 pixels.
; PLAN: r0=34(x), r1=18(y), r2=85(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 18
LDI r2, 85
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
