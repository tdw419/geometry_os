; DESCRIPTION: Creates a orange rectangular region at (135, 91) spanning 33 by 14 pixels.
; PLAN: r0=135(x), r1=91(y), r2=33(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 91
LDI r2, 33
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
