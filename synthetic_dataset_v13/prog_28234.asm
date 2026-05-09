; DESCRIPTION: Creates a yellow rectangular region at (164, 26) spanning 116 by 80 pixels.
; PLAN: r0=164(x), r1=26(y), r2=116(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 26
LDI r2, 116
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
