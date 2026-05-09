; DESCRIPTION: Creates a orange rectangular region at (139, 184) spanning 103 by 33 pixels.
; PLAN: r0=139(x), r1=184(y), r2=103(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 184
LDI r2, 103
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
