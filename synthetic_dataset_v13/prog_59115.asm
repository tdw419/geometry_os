; DESCRIPTION: Creates a yellow rectangular region at (139, 208) spanning 101 by 38 pixels.
; PLAN: r0=139(x), r1=208(y), r2=101(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 208
LDI r2, 101
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
