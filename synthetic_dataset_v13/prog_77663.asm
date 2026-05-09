; DESCRIPTION: Creates a orange rectangular region at (341, 21) spanning 62 by 108 pixels.
; PLAN: r0=341(x), r1=21(y), r2=62(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 21
LDI r2, 62
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
