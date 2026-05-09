; DESCRIPTION: Creates a yellow rectangular region at (41, 214) spanning 10 by 23 pixels.
; PLAN: r0=41(x), r1=214(y), r2=10(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 214
LDI r2, 10
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
