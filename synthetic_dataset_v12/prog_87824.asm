; DESCRIPTION: Creates a blue rectangular region at (383, 31) spanning 58 by 41 pixels.
; PLAN: r0=383(x), r1=31(y), r2=58(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 31
LDI r2, 58
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
