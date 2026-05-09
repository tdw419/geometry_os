; DESCRIPTION: Creates a orange rectangular region at (226, 43) spanning 84 by 22 pixels.
; PLAN: r0=226(x), r1=43(y), r2=84(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 43
LDI r2, 84
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
