; DESCRIPTION: Creates a orange rectangular region at (274, 38) spanning 58 by 62 pixels.
; PLAN: r0=274(x), r1=38(y), r2=58(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 38
LDI r2, 58
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
