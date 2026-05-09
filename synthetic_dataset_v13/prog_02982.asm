; DESCRIPTION: Creates a orange rectangular region at (301, 23) spanning 81 by 34 pixels.
; PLAN: r0=301(x), r1=23(y), r2=81(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 23
LDI r2, 81
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
