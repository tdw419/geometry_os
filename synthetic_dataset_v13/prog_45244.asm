; DESCRIPTION: Creates a orange rectangular region at (345, 26) spanning 28 by 56 pixels.
; PLAN: r0=345(x), r1=26(y), r2=28(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 26
LDI r2, 28
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
