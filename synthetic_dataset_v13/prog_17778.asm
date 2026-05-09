; DESCRIPTION: Creates a green rectangular region at (58, 16) spanning 53 by 106 pixels.
; PLAN: r0=58(x), r1=16(y), r2=53(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 16
LDI r2, 53
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
