; DESCRIPTION: Creates a orange rectangular region at (302, 133) spanning 23 by 43 pixels.
; PLAN: r0=302(x), r1=133(y), r2=23(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 133
LDI r2, 23
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
