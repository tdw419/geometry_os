; DESCRIPTION: Creates a orange rectangular region at (193, 122) spanning 64 by 76 pixels.
; PLAN: r0=193(x), r1=122(y), r2=64(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 122
LDI r2, 64
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
