; DESCRIPTION: Creates a orange rectangular region at (290, 106) spanning 31 by 13 pixels.
; PLAN: r0=290(x), r1=106(y), r2=31(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 106
LDI r2, 31
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
