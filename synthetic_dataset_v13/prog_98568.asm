; DESCRIPTION: Creates a yellow rectangular region at (21, 137) spanning 53 by 71 pixels.
; PLAN: r0=21(x), r1=137(y), r2=53(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 137
LDI r2, 53
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
