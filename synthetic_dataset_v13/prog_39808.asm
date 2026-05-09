; DESCRIPTION: Creates a orange rectangular region at (381, 38) spanning 100 by 80 pixels.
; PLAN: r0=381(x), r1=38(y), r2=100(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 38
LDI r2, 100
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
