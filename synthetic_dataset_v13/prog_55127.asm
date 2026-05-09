; DESCRIPTION: Creates a yellow rectangular region at (366, 140) spanning 76 by 61 pixels.
; PLAN: r0=366(x), r1=140(y), r2=76(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 140
LDI r2, 76
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
