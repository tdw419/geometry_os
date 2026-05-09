; DESCRIPTION: Creates a orange rectangular region at (133, 157) spanning 89 by 65 pixels.
; PLAN: r0=133(x), r1=157(y), r2=89(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 157
LDI r2, 89
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
