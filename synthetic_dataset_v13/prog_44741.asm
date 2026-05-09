; DESCRIPTION: Creates a orange rectangular region at (289, 192) spanning 58 by 25 pixels.
; PLAN: r0=289(x), r1=192(y), r2=58(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 192
LDI r2, 58
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
