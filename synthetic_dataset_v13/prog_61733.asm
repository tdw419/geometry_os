; DESCRIPTION: Creates a orange rectangular region at (110, 95) spanning 114 by 63 pixels.
; PLAN: r0=110(x), r1=95(y), r2=114(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 95
LDI r2, 114
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
