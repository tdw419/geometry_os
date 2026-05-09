; DESCRIPTION: Creates a orange rectangular region at (338, 110) spanning 60 by 85 pixels.
; PLAN: r0=338(x), r1=110(y), r2=60(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 110
LDI r2, 60
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
