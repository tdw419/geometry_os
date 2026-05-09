; DESCRIPTION: Creates a orange rectangular region at (423, 0) spanning 31 by 119 pixels.
; PLAN: r0=423(x), r1=0(y), r2=31(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 0
LDI r2, 31
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
