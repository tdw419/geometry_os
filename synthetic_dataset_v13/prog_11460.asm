; DESCRIPTION: Creates a yellow rectangular region at (396, 22) spanning 40 by 95 pixels.
; PLAN: r0=396(x), r1=22(y), r2=40(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 22
LDI r2, 40
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
