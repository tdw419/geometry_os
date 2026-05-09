; DESCRIPTION: Creates a yellow rectangular region at (438, 10) spanning 29 by 30 pixels.
; PLAN: r0=438(x), r1=10(y), r2=29(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 10
LDI r2, 29
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
