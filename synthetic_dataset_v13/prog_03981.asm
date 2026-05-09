; DESCRIPTION: Creates a yellow rectangular region at (438, 21) spanning 72 by 16 pixels.
; PLAN: r0=438(x), r1=21(y), r2=72(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 21
LDI r2, 72
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
