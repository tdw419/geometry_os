; DESCRIPTION: Creates a orange rectangular region at (308, 144) spanning 119 by 84 pixels.
; PLAN: r0=308(x), r1=144(y), r2=119(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 144
LDI r2, 119
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
