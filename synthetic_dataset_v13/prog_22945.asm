; DESCRIPTION: Creates a orange rectangular region at (159, 154) spanning 75 by 26 pixels.
; PLAN: r0=159(x), r1=154(y), r2=75(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 154
LDI r2, 75
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
