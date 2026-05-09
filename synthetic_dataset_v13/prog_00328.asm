; DESCRIPTION: Creates a orange rectangular region at (199, 37) spanning 60 by 101 pixels.
; PLAN: r0=199(x), r1=37(y), r2=60(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 37
LDI r2, 60
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
