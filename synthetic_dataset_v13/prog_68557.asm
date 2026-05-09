; DESCRIPTION: Creates a black rectangular region at (438, 165) spanning 63 by 56 pixels.
; PLAN: r0=438(x), r1=165(y), r2=63(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 165
LDI r2, 63
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
