; DESCRIPTION: Creates a orange rectangular region at (389, 69) spanning 85 by 108 pixels.
; PLAN: r0=389(x), r1=69(y), r2=85(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 69
LDI r2, 85
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
