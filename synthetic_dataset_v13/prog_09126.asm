; DESCRIPTION: Creates a orange rectangular region at (192, 128) spanning 55 by 78 pixels.
; PLAN: r0=192(x), r1=128(y), r2=55(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 128
LDI r2, 55
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
