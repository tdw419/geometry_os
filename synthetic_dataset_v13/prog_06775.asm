; DESCRIPTION: Creates a orange rectangular region at (12, 21) spanning 108 by 66 pixels.
; PLAN: r0=12(x), r1=21(y), r2=108(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 21
LDI r2, 108
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
