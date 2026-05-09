; DESCRIPTION: Creates a orange rectangular region at (192, 161) spanning 114 by 21 pixels.
; PLAN: r0=192(x), r1=161(y), r2=114(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 161
LDI r2, 114
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
