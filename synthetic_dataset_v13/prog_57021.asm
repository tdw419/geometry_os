; DESCRIPTION: Creates a yellow rectangular region at (133, 176) spanning 37 by 73 pixels.
; PLAN: r0=133(x), r1=176(y), r2=37(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 176
LDI r2, 37
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
