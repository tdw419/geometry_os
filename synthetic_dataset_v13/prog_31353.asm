; DESCRIPTION: Creates a orange rectangular region at (159, 99) spanning 65 by 40 pixels.
; PLAN: r0=159(x), r1=99(y), r2=65(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 99
LDI r2, 65
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
