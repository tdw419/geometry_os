; DESCRIPTION: Creates a yellow rectangular region at (326, 167) spanning 100 by 49 pixels.
; PLAN: r0=326(x), r1=167(y), r2=100(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 167
LDI r2, 100
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
