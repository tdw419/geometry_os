; DESCRIPTION: Creates a orange rectangular region at (231, 40) spanning 34 by 72 pixels.
; PLAN: r0=231(x), r1=40(y), r2=34(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 40
LDI r2, 34
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
