; DESCRIPTION: Creates a orange rectangular region at (55, 151) spanning 23 by 44 pixels.
; PLAN: r0=55(x), r1=151(y), r2=23(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 151
LDI r2, 23
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
