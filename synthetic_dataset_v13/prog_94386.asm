; DESCRIPTION: Creates a orange rectangular region at (469, 180) spanning 26 by 62 pixels.
; PLAN: r0=469(x), r1=180(y), r2=26(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 180
LDI r2, 26
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
