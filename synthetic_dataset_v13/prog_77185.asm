; DESCRIPTION: Creates a orange rectangular region at (419, 199) spanning 60 by 13 pixels.
; PLAN: r0=419(x), r1=199(y), r2=60(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 199
LDI r2, 60
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
