; DESCRIPTION: Creates a yellow rectangular region at (208, 140) spanning 34 by 87 pixels.
; PLAN: r0=208(x), r1=140(y), r2=34(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 140
LDI r2, 34
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
