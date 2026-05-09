; DESCRIPTION: Creates a black rectangular region at (430, 24) spanning 61 by 46 pixels.
; PLAN: r0=430(x), r1=24(y), r2=61(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 24
LDI r2, 61
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
