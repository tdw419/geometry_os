; DESCRIPTION: Creates a orange rectangular region at (136, 87) spanning 22 by 11 pixels.
; PLAN: r0=136(x), r1=87(y), r2=22(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 87
LDI r2, 22
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
