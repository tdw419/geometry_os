; DESCRIPTION: Creates a green rectangular region at (397, 182) spanning 29 by 41 pixels.
; PLAN: r0=397(x), r1=182(y), r2=29(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 182
LDI r2, 29
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
