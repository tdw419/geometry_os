; DESCRIPTION: Creates a green rectangular region at (114, 164) spanning 31 by 83 pixels.
; PLAN: r0=114(x), r1=164(y), r2=31(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 164
LDI r2, 31
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
