; DESCRIPTION: Creates a orange rectangular region at (13, 110) spanning 28 by 21 pixels.
; PLAN: r0=13(x), r1=110(y), r2=28(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 110
LDI r2, 28
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
