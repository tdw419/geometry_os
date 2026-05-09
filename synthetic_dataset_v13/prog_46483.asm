; DESCRIPTION: Creates a orange rectangular region at (407, 33) spanning 34 by 33 pixels.
; PLAN: r0=407(x), r1=33(y), r2=34(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 33
LDI r2, 34
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
