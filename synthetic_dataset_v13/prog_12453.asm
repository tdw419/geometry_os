; DESCRIPTION: Creates a orange rectangular region at (149, 27) spanning 87 by 38 pixels.
; PLAN: r0=149(x), r1=27(y), r2=87(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 27
LDI r2, 87
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
