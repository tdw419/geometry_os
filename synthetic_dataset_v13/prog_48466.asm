; DESCRIPTION: Creates a orange rectangular region at (301, 44) spanning 98 by 22 pixels.
; PLAN: r0=301(x), r1=44(y), r2=98(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 44
LDI r2, 98
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
