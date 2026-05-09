; DESCRIPTION: Creates a black rectangular region at (83, 167) spanning 33 by 60 pixels.
; PLAN: r0=83(x), r1=167(y), r2=33(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 167
LDI r2, 33
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
