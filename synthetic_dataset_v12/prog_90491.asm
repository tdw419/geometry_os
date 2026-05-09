; DESCRIPTION: Creates a orange rectangular region at (145, 34) spanning 60 by 52 pixels.
; PLAN: r0=145(x), r1=34(y), r2=60(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 34
LDI r2, 60
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
