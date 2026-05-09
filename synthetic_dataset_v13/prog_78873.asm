; DESCRIPTION: Creates a orange rectangular region at (236, 5) spanning 33 by 99 pixels.
; PLAN: r0=236(x), r1=5(y), r2=33(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 5
LDI r2, 33
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
