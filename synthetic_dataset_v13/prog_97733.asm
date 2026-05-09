; DESCRIPTION: Creates a yellow rectangular region at (300, 22) spanning 41 by 14 pixels.
; PLAN: r0=300(x), r1=22(y), r2=41(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 22
LDI r2, 41
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
