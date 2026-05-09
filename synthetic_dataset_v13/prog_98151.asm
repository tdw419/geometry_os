; DESCRIPTION: Creates a yellow rectangular region at (170, 63) spanning 41 by 109 pixels.
; PLAN: r0=170(x), r1=63(y), r2=41(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 63
LDI r2, 41
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
