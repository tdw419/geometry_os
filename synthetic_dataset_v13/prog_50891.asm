; DESCRIPTION: Creates a yellow rectangular region at (181, 193) spanning 34 by 30 pixels.
; PLAN: r0=181(x), r1=193(y), r2=34(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 193
LDI r2, 34
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
