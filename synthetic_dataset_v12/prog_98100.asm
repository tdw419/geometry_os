; DESCRIPTION: Creates a orange rectangular region at (321, 34) spanning 25 by 19 pixels.
; PLAN: r0=321(x), r1=34(y), r2=25(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 34
LDI r2, 25
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
