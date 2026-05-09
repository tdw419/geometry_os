; DESCRIPTION: Creates a yellow rectangular region at (157, 31) spanning 75 by 60 pixels.
; PLAN: r0=157(x), r1=31(y), r2=75(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 31
LDI r2, 75
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
