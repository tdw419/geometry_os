; DESCRIPTION: Creates a yellow rectangular region at (312, 168) spanning 115 by 71 pixels.
; PLAN: r0=312(x), r1=168(y), r2=115(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 168
LDI r2, 115
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
