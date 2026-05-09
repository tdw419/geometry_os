; DESCRIPTION: Creates a yellow rectangular region at (24, 112) spanning 41 by 35 pixels.
; PLAN: r0=24(x), r1=112(y), r2=41(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 112
LDI r2, 41
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
