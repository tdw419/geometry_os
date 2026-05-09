; DESCRIPTION: Creates a orange rectangular region at (291, 169) spanning 82 by 84 pixels.
; PLAN: r0=291(x), r1=169(y), r2=82(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 169
LDI r2, 82
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
