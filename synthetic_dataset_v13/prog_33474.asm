; DESCRIPTION: Creates a orange rectangular region at (88, 240) spanning 100 by 13 pixels.
; PLAN: r0=88(x), r1=240(y), r2=100(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 240
LDI r2, 100
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
