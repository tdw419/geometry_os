; DESCRIPTION: Creates a orange rectangular region at (171, 100) spanning 63 by 100 pixels.
; PLAN: r0=171(x), r1=100(y), r2=63(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 100
LDI r2, 63
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
