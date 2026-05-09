; DESCRIPTION: Creates a orange rectangular region at (288, 43) spanning 101 by 22 pixels.
; PLAN: r0=288(x), r1=43(y), r2=101(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 43
LDI r2, 101
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
