; DESCRIPTION: Creates a orange rectangular region at (424, 26) spanning 76 by 76 pixels.
; PLAN: r0=424(x), r1=26(y), r2=76(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 26
LDI r2, 76
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
