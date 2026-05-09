; DESCRIPTION: Creates a orange rectangular region at (320, 170) spanning 55 by 34 pixels.
; PLAN: r0=320(x), r1=170(y), r2=55(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 170
LDI r2, 55
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
