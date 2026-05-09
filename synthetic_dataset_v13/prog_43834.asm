; DESCRIPTION: Creates a orange rectangular region at (282, 33) spanning 38 by 44 pixels.
; PLAN: r0=282(x), r1=33(y), r2=38(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 33
LDI r2, 38
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
