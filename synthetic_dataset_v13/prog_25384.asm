; DESCRIPTION: Creates a orange rectangular region at (429, 3) spanning 22 by 99 pixels.
; PLAN: r0=429(x), r1=3(y), r2=22(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 3
LDI r2, 22
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
