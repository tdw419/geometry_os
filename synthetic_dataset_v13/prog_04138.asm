; DESCRIPTION: Creates a orange rectangular region at (378, 54) spanning 22 by 101 pixels.
; PLAN: r0=378(x), r1=54(y), r2=22(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 54
LDI r2, 22
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
