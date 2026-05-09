; DESCRIPTION: Creates a orange rectangular region at (438, 53) spanning 70 by 77 pixels.
; PLAN: r0=438(x), r1=53(y), r2=70(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 53
LDI r2, 70
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
