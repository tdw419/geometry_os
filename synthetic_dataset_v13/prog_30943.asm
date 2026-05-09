; DESCRIPTION: Creates a orange rectangular region at (371, 65) spanning 11 by 101 pixels.
; PLAN: r0=371(x), r1=65(y), r2=11(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 65
LDI r2, 11
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
