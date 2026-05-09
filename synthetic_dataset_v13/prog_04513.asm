; DESCRIPTION: Creates a orange rectangular region at (91, 145) spanning 38 by 78 pixels.
; PLAN: r0=91(x), r1=145(y), r2=38(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 145
LDI r2, 38
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
