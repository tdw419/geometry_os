; DESCRIPTION: Creates a orange rectangular region at (38, 18) spanning 82 by 31 pixels.
; PLAN: r0=38(x), r1=18(y), r2=82(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 18
LDI r2, 82
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
