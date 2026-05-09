; DESCRIPTION: Creates a orange rectangular region at (62, 204) spanning 95 by 33 pixels.
; PLAN: r0=62(x), r1=204(y), r2=95(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 204
LDI r2, 95
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
