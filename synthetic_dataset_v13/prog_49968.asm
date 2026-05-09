; DESCRIPTION: Creates a orange rectangular region at (301, 148) spanning 84 by 105 pixels.
; PLAN: r0=301(x), r1=148(y), r2=84(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 148
LDI r2, 84
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
