; DESCRIPTION: Creates a orange rectangular region at (68, 188) spanning 25 by 31 pixels.
; PLAN: r0=68(x), r1=188(y), r2=25(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 188
LDI r2, 25
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
