; DESCRIPTION: Creates a orange rectangular region at (166, 144) spanning 83 by 37 pixels.
; PLAN: r0=166(x), r1=144(y), r2=83(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 144
LDI r2, 83
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
