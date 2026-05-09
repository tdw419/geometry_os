; DESCRIPTION: Creates a orange rectangular region at (236, 56) spanning 34 by 75 pixels.
; PLAN: r0=236(x), r1=56(y), r2=34(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 56
LDI r2, 34
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
