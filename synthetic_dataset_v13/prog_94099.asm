; DESCRIPTION: Creates a orange rectangular region at (417, 68) spanning 35 by 37 pixels.
; PLAN: r0=417(x), r1=68(y), r2=35(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 68
LDI r2, 35
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
