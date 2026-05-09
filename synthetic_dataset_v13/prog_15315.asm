; DESCRIPTION: Creates a yellow rectangular region at (58, 140) spanning 38 by 103 pixels.
; PLAN: r0=58(x), r1=140(y), r2=38(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 140
LDI r2, 38
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
