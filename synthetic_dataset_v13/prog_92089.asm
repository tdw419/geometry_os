; DESCRIPTION: Creates a orange rectangular region at (321, 57) spanning 110 by 45 pixels.
; PLAN: r0=321(x), r1=57(y), r2=110(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 57
LDI r2, 110
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
