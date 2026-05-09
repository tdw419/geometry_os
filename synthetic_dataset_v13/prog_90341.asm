; DESCRIPTION: Creates a yellow rectangular region at (354, 0) spanning 112 by 41 pixels.
; PLAN: r0=354(x), r1=0(y), r2=112(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 0
LDI r2, 112
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
