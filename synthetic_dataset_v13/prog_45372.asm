; DESCRIPTION: Creates a orange rectangular region at (388, 172) spanning 56 by 25 pixels.
; PLAN: r0=388(x), r1=172(y), r2=56(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 172
LDI r2, 56
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
