; DESCRIPTION: Creates a yellow rectangular region at (199, 26) spanning 119 by 103 pixels.
; PLAN: r0=199(x), r1=26(y), r2=119(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 26
LDI r2, 119
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
