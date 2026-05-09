; DESCRIPTION: Creates a orange rectangular region at (251, 64) spanning 97 by 84 pixels.
; PLAN: r0=251(x), r1=64(y), r2=97(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 64
LDI r2, 97
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
