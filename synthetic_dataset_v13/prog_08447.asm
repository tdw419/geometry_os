; DESCRIPTION: Creates a orange rectangular region at (159, 218) spanning 92 by 37 pixels.
; PLAN: r0=159(x), r1=218(y), r2=92(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 218
LDI r2, 92
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
