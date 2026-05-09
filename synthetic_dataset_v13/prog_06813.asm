; DESCRIPTION: Creates a orange rectangular region at (55, 162) spanning 96 by 56 pixels.
; PLAN: r0=55(x), r1=162(y), r2=96(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 162
LDI r2, 96
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
