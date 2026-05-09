; DESCRIPTION: Creates a orange rectangular region at (347, 82) spanning 62 by 106 pixels.
; PLAN: r0=347(x), r1=82(y), r2=62(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 82
LDI r2, 62
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
