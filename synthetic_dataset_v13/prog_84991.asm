; DESCRIPTION: Creates a yellow rectangular region at (260, 58) spanning 41 by 15 pixels.
; PLAN: r0=260(x), r1=58(y), r2=41(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 58
LDI r2, 41
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
